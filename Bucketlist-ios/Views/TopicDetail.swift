//
//  TopicDetail.swift
//  Bucketlist-ios
//
//  Created by Safal Neupane on 13/10/2022.
//

import SwiftUI

struct TopicDetail: View {
    let topic: Topic
    
    var body: some View {
        List {
            Text("This is a short description of this topic. This must be short and sweet and describe the purpose of this topic")
                .font(.caption)
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
            }
        }
        .navigationTitle(topic.title)
    }
}

struct TopicDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TopicDetail(topic: Topic.sampleData[0])
        }
    }
}
