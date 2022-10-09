//
//  Bucketlist_iosApp.swift
//  Bucketlist-ios
//
//  Created by Safal Neupane on 9/10/2022.
//

import SwiftUI

@main
struct Bucketlist_iosApp: App {
    @State private var buckets: [Bucket] = Bucket.sampleData
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                BucketsView(buckets: $buckets)
            }
        }
    }
}
