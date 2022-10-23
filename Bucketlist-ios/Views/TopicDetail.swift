//
//  TopicDetail.swift
//  Bucketlist-ios
//
//  Created by Safal Neupane on 13/10/2022.
//

import SwiftUI

struct TopicDetail: View {
    @Binding var topic: Topic
    @State private var newItemTitle = ""
    
    var body: some View {
        List {
            Section(header: Text("Items")) {
                HStack {
                    Text("Tasks: \(topic.items.count)")
                    Spacer()
                    if topic.completedItemsCount > 0 {
                        Text("Done: \(topic.completedItemsCount)")
                    }
                }
                .listRowBackground(Color("Blue"))
                .foregroundColor(.white)
                ForEach(topic.items) { item in
                    Text(item.title)
                        .strikethrough(item.isCompleted)
                }
                .onDelete { index in
                    
                }
                HStack {
                    TextField("New Item", text: $newItemTitle)
                    Button(action: {
                        let newItem = Topic.Item(title: newItemTitle)
                        topic.items.append(newItem)
                        newItemTitle = ""
                    }) {
                        Image(systemName: "plus.circle.fill")
                    }.disabled(newItemTitle.isEmpty)
                }
            }
        }
        .navigationTitle(topic.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TopicDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TopicDetail(topic: .constant(Topic.previewData[0]))
        }
    }
}
