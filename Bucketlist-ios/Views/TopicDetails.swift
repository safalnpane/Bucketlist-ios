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
