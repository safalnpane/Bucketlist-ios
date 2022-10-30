//
//  Topic.swift
//  Bucketlist-ios
//
//  Created by Safal Neupane on 10/10/2022.
//

import SwiftUI

struct Buckets: View {
    
    var buckets: [Bucket]
        
    var body: some View {
        List {
            ForEach(buckets) { bucket in
                NavigationLink(destination: BucketDetails(bucket: bucket)) {
                    Text(bucket.name)
                        .font(.headline)
                        .frame(height: 90)
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button(action: {}) {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

struct BucketList_Previews: PreviewProvider {
    static let previewBuckets = [
        Bucket(name: "Test Bucket 1", description: "This is a test bucket 1"),
        Bucket(name: "Test Bucket 2", description: "This is a test bucket 2"),
        Bucket(name: "Test Bucket 3", description: "This is a test bucket 3"),
        Bucket(name: "Test Bucket 4", description: "This is a test bucket 4")
    ]
    static var previews: some View {
        NavigationView {
            Buckets(buckets: previewBuckets)
                .navigationTitle("Buckets")
        }
    }
}
