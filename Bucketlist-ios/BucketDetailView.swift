//
//  BucketDetailView.swift
//  Bucketlist-ios
//
//  Created by Safal Neupane on 9/10/2022.
//

import SwiftUI

struct BucketDetailView: View {
    @Binding var bucket: Bucket
    
    var body: some View {
        List {
            Section(header: Text("Bucket Info")) {
                Text(bucket.name)
                    .font(.headline)
                Text(bucket.description)
                    .font(.subheadline)
                Text(bucket.createdDate, style: .date)
            }
            Section(header: Text("Lists in this bucket")) {
                NavigationLink(destination: Text("Expenses")) {
                    Text("Expenses")
                }
                NavigationLink(destination: Text("People")) {
                    Text("People")
                }
                NavigationLink(destination: Text("Stops")) {
                    Text("Stops")
                }
            }
            Section(header: Text("Friends")) {
                Label("Safal", systemImage: "person")
                Label("Sulav", systemImage: "person")
                Label("Surakshya", systemImage: "person")
            }
        }
        .navigationTitle(bucket.name)
        .toolbar {
            Button("Edit") {
                
            }
        }
    }
}

struct BucketDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BucketDetailView(bucket: .constant(Bucket.sampleData[0]))
        }
    }
}
