//
//  Nav.swift
//  Bucketlist-ios
//
//  Created by Safal Neupane on 13/10/2022.
//

import SwiftUI

struct Nav: View {
    @State private var defaultSelection = 2
    
    var body: some View {
        TabView(selection: $defaultSelection) {
            NavigationView {
                Notification()
                    .navigationTitle("Notifications")
            }
            .tabItem { Label("Notification", systemImage: "bell") }.tag(1)
            NavigationView {
                Buckets()
                    .navigationTitle("Buckets")
            }
            .tabItem { Label("Buckets", systemImage: "basket")}.tag(2)
            NavigationView {
                UserProfile()
                    .navigationTitle("Your profile")
            }
            .tabItem { Label("User", systemImage: "person") }.tag(3)
        }
    }
}

struct Nav_Previews: PreviewProvider {
    static var previews: some View {
            Nav()
    }
}
