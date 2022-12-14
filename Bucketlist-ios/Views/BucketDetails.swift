//
//  BucketDetails.swift
//  Bucketlist-ios
//
//  Created by Safal Neupane on 30/10/2022.
//

import SwiftUI

struct BucketDetails: View {
    let bucket: Bucket
    @StateObject var topicViewModel = TopicViewModel()
    @State private var isCreatingNewTopic = false
    @State private var newTopicName = ""
    
    var body: some View {
        List {
            Section(header: Text("Bucket Info")) {
                Text(bucket.description)
                    .frame(minHeight: 50)
                HStack {
                    Text("Created on:")
                        .fontWeight(.bold)
                    Spacer()
                    Text(bucket.created_at, style: .date)
                }
                HStack {
                    Text("Updated on:")
                        .fontWeight(.bold)
                    Spacer()
                    Text(bucket.updated_at, style: .date)
                }
            }
            Section(header: Text("Owners")) {
                HStack {
                    ForEach(bucket.owners) { owner in
                        Text(owner.username)
                            .font(.caption)
                            .padding(5)
                            .background(.gray)
                            .foregroundColor(.white)
                            .cornerRadius(5)
                    }
                }
            }
            Section(header: Text("Topics")) {
                switch topicViewModel.phase {
                case .empty: ProgressView()
                case .success(let topics):
                    if topics.isEmpty {
                        Text("No topics on this bucket")
                            .fontWeight(.bold)
                    } else {
                        ForEach(topics) { topic in
                            NavigationLink(destination: TopicDetails(topic: topic)) {
                                Text(topic.name)
                            }
                        }
                    }
                case .failure(let error): Text(error.localizedDescription)
                }
            }
        }
        .navigationTitle(bucket.name)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            Task.init {
                await topicViewModel.loadTopics(bucketId: bucket.id)
            }
        }
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button(action: {isCreatingNewTopic = true}) {
                    Image(systemName: "plus")
                }
            }
        }
        .alert("New Topic", isPresented: $isCreatingNewTopic, actions:  {
            TextField("Topic Name", text: $newTopicName)
            Button("Create", action: {
                if !newTopicName.isEmpty {
                    Task.init {
                        await topicViewModel.createTopic(using: newTopicName, bucketId: bucket.id)
                        isCreatingNewTopic = false
                        newTopicName = ""
                    }
                }
            })
            Button("Cancel", role: .cancel, action: {
                isCreatingNewTopic = false
                newTopicName = ""
            })
        }, message: {
            Text("Provide a name for your new bucket.")
        })
    }
    
    private var lists: [Topic] {
        if case let .success(topics) = topicViewModel.phase {
            return topics
        } else {
            return []
        }
    }
}

struct BucketDetails_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BucketDetails(bucket: Bucket.previewData[0])
        }
    }
}
