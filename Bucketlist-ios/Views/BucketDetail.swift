//
//  BucketDetail.swift
//  Bucketlist-ios
//
//  Created by Safal Neupane on 13/10/2022.
//

import SwiftUI

struct BucketDetail: View {
    @Binding var bucket: Bucket
    
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
                ForEach(bucket.topics) { topic in
                    NavigationLink(destination: Text("Hello")) {
                        TopicCard(topic: topic)
                    }
                }
            }
        }
        .navigationTitle(bucket.name)
    }
}

struct BucketDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BucketDetail(bucket: .constant(Bucket.sampleData[0]))
        }
    }
}
