//
//  ContentView.swift
//  Bucketlist-ios
//
//  Created by Safal Neupane on 9/10/2022.
//

import SwiftUI

struct BucketsView: View {
    @Binding var buckets: [Bucket]
    
    var body: some View {
        List {
            ForEach(buckets) { bucket in
                NavigationLink(destination: Text(bucket.name)) {
                    BucketCardView(bucket: bucket)
                }
            }
        }
        .navigationTitle("My buckets")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BucketsView(buckets: .constant(Bucket.sampleData))
        }
    }
}
