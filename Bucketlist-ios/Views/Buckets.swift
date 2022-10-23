//
//  BucketList.swift
//  Bucketlist-ios
//
//  Created by Safal Neupane on 10/10/2022.
//

import SwiftUI

struct Buckets: View {
    @State private var buckets: [Bucket] = Bucket.previewData
    @State private var isCreatingNewBucket = false
    @State private var newBucket = Bucket(name: "", description: "")
    
    var body: some View {
        List {
            ForEach($buckets) { $bucket in
                NavigationLink(destination: BucketDetail(bucket: $bucket)) {
                    BucketCard(bucket: bucket)
                }
            }
        }
        .toolbar {
            Button(action: { isCreatingNewBucket = true }) {
                Image(systemName: "plus")
            }
        }
        .sheet(isPresented: $isCreatingNewBucket) {
            NavigationView {
                NewBucket(bucket: $newBucket)
                    .navigationTitle("New Bucket")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Dismiss") {
                                newBucket = Bucket(name: "", description: "")
                                isCreatingNewBucket = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done")
                            {
                                buckets.append(newBucket)
                                newBucket = Bucket(name: "", description: "")
                                isCreatingNewBucket = false
                            }
                            .disabled((newBucket.name.isEmpty) || (newBucket.description.isEmpty))
                        }
                    }
            }
        }
    }
}

struct BucketList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Buckets()
                .navigationTitle("Buckets")
        }
    }
}
