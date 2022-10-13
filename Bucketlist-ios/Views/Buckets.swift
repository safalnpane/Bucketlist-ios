//
//  BucketList.swift
//  Bucketlist-ios
//
//  Created by Safal Neupane on 10/10/2022.
//

import SwiftUI

struct Buckets: View {
    @State private var buckets = Bucket.sampleData
    
    var body: some View {
        List {
            ForEach($buckets) { $bucket in
                NavigationLink(destination: BucketDetail(bucket: $bucket)) {
                    BucketCard(bucket: bucket)
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
