//
//  BucketDetail.swift
//  Bucketlist-ios
//
//  Created by Safal Neupane on 13/10/2022.
//

import SwiftUI

struct BucketDetail: View {
    @Binding var bucket: Bucket
    @State private var isEditingBucket = false
    
    var body: some View {
        List {
            Section(header: Text("Bucket Info")) {
                Text(bucket.description)
                    .font(.subheadline)
                VStack {
                    HStack {
                        Text("Created At:")
                        Text(bucket.createdAt, style: .date)
                    }
                    HStack {
                        Text("Updated At:")
                        Text(bucket.updatedAt, style: .date)
                    }
                }
                .font(.caption)
            }
            Section(header: Text("Topics")) {
                ForEach($bucket.topics) { $topic in
                    NavigationLink(destination: TopicDetail(topic: $topic)) {
                        TopicCard(topic: topic)
                    }
                }
            }
        }
        .navigationTitle(bucket.name)
        .toolbar {
            Button(action: {
                isEditingBucket = true
                
            }) {
                Text("Edit")
            }
        }
        .sheet(isPresented: $isEditingBucket) {
            NavigationView {
                NewBucket(bucket: $bucket)
                    .navigationTitle(bucket.name)
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                isEditingBucket = false
                            }
                        }
                    }
            }
        }
    }
}

struct BucketDetail_Previews: PreviewProvider {
    static var previews: some View {
        BucketDetail(bucket: .constant(Bucket.previewData[0]))
    }
}
