//
//  Topic.swift
//  Bucketlist-ios
//
//  Created by Safal Neupane on 10/10/2022.
//

import SwiftUI

struct Buckets: View {
    
    @State private var isCreatingNewBucket = false
    @State private var newBucket = Bucket()
    @StateObject var bucketViewModel = BucketViewModel()
        
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
                Button(action: { isCreatingNewBucket = true }) { Image(systemName: "plus") }
            }
        }
        .sheet(isPresented: $isCreatingNewBucket) {
            NavigationView {
                NewBucketForm(newBucket: $newBucket)
                    .toolbar {
                        ToolbarItem(placement: .confirmationAction) {
                            Button(action: {
                                Task.init {
                                    await bucketViewModel.createBucket(using: newBucket)
                                    isCreatingNewBucket = false
                                    newBucket = Bucket()
                                }
                            }) { Text("Create")}
                        }
                        ToolbarItem(placement: .cancellationAction) {
                            Button(action: {
                                isCreatingNewBucket = false
                                newBucket = Bucket()
                            }) { Text("Dismiss")}
                        }
                    }
                    .navigationTitle("Create new bucket")
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
        .onAppear {
            Task.init {
                await bucketViewModel.loadBuckets()
            }
        }
        .overlay(overlayView)
    }
    
    @ViewBuilder
    private var overlayView: some View {
        switch bucketViewModel.phase {
        case .empty: ProgressView()
        case .success(let buckets) where buckets.isEmpty: Text("No Buckets")
        case .failure(let error): Text(error.localizedDescription)
        default: EmptyView()
        }
    }
    
    private var buckets: [Bucket] {
        if case let .success(buckets) = bucketViewModel.phase {
            return buckets
        } else {
            return []
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
            Buckets()
                .navigationTitle("Buckets")
        }
    }
}
