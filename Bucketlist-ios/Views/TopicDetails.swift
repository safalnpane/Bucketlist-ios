//
//  TopicDetails.swift
//  Bucketlist-ios
//
//  Created by Safal Neupane on 30/10/2022.
//

import SwiftUI

struct TopicDetails: View {
    let topic: Topic
    @StateObject var itemViewModel = ItemViewModel()
    @State private var isCreatingNewItem = false
    @State private var isDisplayingInfo = false
    @State private var alertInfo = ""
    @State private var newItemValue = ""
    @State private var newItemTag = ""
    
    var body: some View {
        List {
            Section(header: Text("Topic Info")) {
                HStack {
                    Text("Created on")
                        .fontWeight(.bold)
                    Spacer()
                    Text(topic.created_at, style: .date)
                }
                HStack {
                    Text("Last updated")
                        .fontWeight(.bold)
                    Spacer()
                    Text(topic.updated_at, style: .date)
                }
            }
            Section(header: Text("Items")) {
                switch itemViewModel.phase {
                case .empty: ProgressView()
                case.failure(let error): Text(error.localizedDescription)
                case .success(let items):
                    if items.isEmpty {
                        Text("No items on this topic")
                            .fontWeight(.bold)
                    } else {
                        ForEach(items) { item in
                            HStack {
                                Text(item.value)
                                    .strikethrough(item.is_completed)
                                Spacer()
                                if let tag = item.tag {
                                    Text(tag)
                                        .strikethrough(item.is_completed)
                                        .fontWeight(.bold)
                                }
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle(topic.name)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            Task.init {
                await itemViewModel.loadItems(topicId: topic.id)
            }
        }
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button(action: { isCreatingNewItem = true }) {
                    Image(systemName: "plus")
                }
            }
        }
        .alert("New Item", isPresented: $isCreatingNewItem, actions: {
            TextField("Item value", text: $newItemValue)
            TextField("Tag (Optional)", text: $newItemTag)
            Button("Cancel", role: .cancel, action: {
                isCreatingNewItem = false
                newItemValue = ""
                newItemTag = ""
            })
            Button("Create", action: {
                if !newItemValue.isEmpty {
                    if (newItemValue.count >= 50){
                        isCreatingNewItem = false
                        alertInfo = "Item value can not be longer than 50 characters."
                        isDisplayingInfo = true
                    }else if (newItemTag.count >= 20) {
                        isCreatingNewItem = false
                        alertInfo = "Item tag can not be longer than 20 characters."
                        isDisplayingInfo = true
                    } else {
                        Task.init {
                            await itemViewModel.createItem(from: newItemValue, tag: newItemTag,topicId: topic.id)
                            newItemValue = ""
                            newItemTag = ""
                            isCreatingNewItem = false
                        }
                    }
                } else {
                    isCreatingNewItem = false
                    alertInfo = "You must provide a value."
                    isDisplayingInfo = true
                }
            })
        }, message: {
            Text("Provide a value for your item")
        })
        .alert("Oops!", isPresented: $isDisplayingInfo, actions: {
            Button("Dismiss", role: .cancel, action: {
                isCreatingNewItem = true
                isDisplayingInfo = false
            })
        }, message: {
            Text(alertInfo)
        })
    }
    
    private var items: [Item] {
        if case let .success(items) = itemViewModel.phase {
            return items
        } else {
            return []
        }
    }
}

struct TopicDetails_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TopicDetails(topic: Topic(bucket_name: "Test Bucket", name: "Test Topic"))
        }
    }
}
