//
//  NewBucket.swift
//  Bucketlist-ios
//
//  Created by Safal Neupane on 14/10/2022.
//

import SwiftUI

struct NewBucket: View {
    @Binding var bucket: Bucket
    @State private var newTopicName = ""
    
    var body: some View {
        Form {
            Section(header: Text("Bucket Info")) {
                TextField("New Bucket", text: $bucket.name)
                TextEditor(text: $bucket.description)
                    .frame(minHeight: 50)
            }
            Section(header: Text("Topics")) {
                List {
                    ForEach(bucket.topics) { topic in
                        Text(topic.title)
                    }
                    .onDelete { indices in
                        bucket.topics.remove(atOffsets: indices)
                    }
                    HStack {
                        TextField("New Topic", text: $newTopicName)
                        Button(action: {
                            let newTopic = Topic(title: newTopicName)
                            bucket.topics.append(newTopic)
                            newTopicName = ""
                        }) {
                            Image(systemName: "plus.circle.fill")
                        }
                        .disabled(newTopicName.isEmpty)
                    }
                }
            }
        }
    }
}

struct NewBucket_Previews: PreviewProvider {
    static var previews: some View {
        NewBucket(bucket: .constant(Bucket.previewData[0]))
    }
}
