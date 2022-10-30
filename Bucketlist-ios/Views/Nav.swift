//
//  Nav.swift
//  Bucketlist-ios
//
//  Created by Safal Neupane on 13/10/2022.
//

import SwiftUI

struct Nav: View {
    @State private var defaultSelection = 2
    @StateObject var bucketViewModel = BucketViewModel()
    
    var body: some View {
        TabView(selection: $defaultSelection) {
            NavigationView {
                Notification()
                    .navigationTitle("Notifications")
            }
            .tabItem { Label("Notification", systemImage: "bell") }.tag(1)
            NavigationView {
                Buckets(buckets: buckets)
                    .overlay(overlayView)
                    .navigationTitle("Buckets")
                    .task(id: defaultSelection, loadBuckets)
            }
            .tabItem { Label("Buckets", systemImage: "basket")}.tag(2)
            NavigationView {
                UserProfile()
                    .navigationTitle("Your profile")
            }
            .tabItem { Label("User", systemImage: "person") }.tag(3)
        }
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
    
    @Sendable
    private func loadBuckets() async {
        await bucketViewModel.loadBuckets()
    }
    
    private var buckets: [Bucket] {
        if case let .success(buckets) = bucketViewModel.phase {
            return buckets
        } else {
            return []
        }
    }
}

struct Nav_Previews: PreviewProvider {
    static var previews: some View {
            Nav()
    }
}
