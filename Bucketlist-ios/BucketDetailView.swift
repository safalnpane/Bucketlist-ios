//
//  BucketDetailView.swift
//  Bucketlist-ios
//
//  Created by Safal Neupane on 9/10/2022.
//

import SwiftUI

struct BucketDetailView: View {
    @Binding var bucket: Bucket
    @State private var isPresentingEditView = false
    
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
                ForEach(bucket.lists) { list in
                    NavigationLink(destination: Text(list.name)) {
                        Text(list.name)
                            .foregroundColor(.accentColor)
                    }
                }
                Button(action: {}) {
                    Label("Add new list", systemImage: "plus")
                }
            }
            Section(header: Text("Friends")) {
                if bucket.people.count < 1 {
                    Text("Bucket is not shared")
                }
                ForEach(bucket.people) { person in
                    Label(person.email, systemImage: "person")
                }
            }
        }
        .navigationTitle(bucket.name)
        .toolbar {
            Button("Edit") {
                isPresentingEditView = true
            }
        }
        .sheet(isPresented: $isPresentingEditView) {
            NavigationView {
                BucketModifyView(bucket: $bucket)
                    .navigationTitle(bucket.name)
                    .toolbar {
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                isPresentingEditView = false
                            }
                        }
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Dismiss") {
                                isPresentingEditView = false
                            }
                        }
                    }
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
