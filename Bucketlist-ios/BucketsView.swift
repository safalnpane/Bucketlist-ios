//
//  ContentView.swift
//  Bucketlist-ios
//
//  Created by Safal Neupane on 9/10/2022.
//

import SwiftUI

struct BucketsView: View {
    @Binding var buckets: [Bucket]
    @State private var isPresentingNewBucket = false
    @State private var newBucket = Bucket()
    
    var body: some View {
        List {
            ForEach($buckets) { $bucket in
                NavigationLink(destination: BucketDetailView(bucket: $bucket)) {
                    BucketCardView(bucket: bucket)
                }
            }
        }
        .navigationTitle("My buckets")
        .toolbar {
            Button(action: { isPresentingNewBucket = true }) {
                Image(systemName: "plus")
            }
        }
        .sheet(isPresented: $isPresentingNewBucket) {
            NavigationView {
                BucketModifyView(bucket: $newBucket)
                    .toolbar {
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Add") {
                                buckets.append(newBucket)
                                isPresentingNewBucket = false
                                newBucket = Bucket()
                            }
                        }
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Dismiss") {
                                newBucket = Bucket()
                                isPresentingNewBucket = false
                            }
                        }
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BucketsView(buckets: .constant(Bucket.sampleData))
        }
    }
}
