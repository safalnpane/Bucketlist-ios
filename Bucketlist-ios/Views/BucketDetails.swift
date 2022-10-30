//
//  BucketDetails.swift
//  Bucketlist-ios
//
//  Created by Safal Neupane on 30/10/2022.
//

import SwiftUI

struct BucketDetails: View {
    let bucket: Bucket
    @StateObject var listViewModel = ListViewModel()
    
    var body: some View {
        List {
            Section(header: Text("Bucket Info")) {
                Text(bucket.description)
                    .frame(minHeight: 50)
                HStack {
                    Text("Owners:")
                        .fontWeight(.bold)
                    Spacer()
                    ForEach(bucket.owners) { owner in
                        Text(owner.username)
                            .font(.caption)
                            .padding(5)
                            .background(.gray)
                            .foregroundColor(.white)
                            .cornerRadius(5)
                    }
                }
            }
            Section(header: Text("Topics")) {
                switch listViewModel.phase {
                case .empty: ProgressView()
                case .success(let lists):
                    if lists.isEmpty {
                        Text("No topics on this bucket")
                            .fontWeight(.bold)
                    } else {
                        ForEach(lists) { list in
                            NavigationLink(destination: Text("Topic Detail")) {
                                Text(list.name)
                            }
                        }
                    }
                case .failure(let error): Text(error.localizedDescription)
                }
            }
        }
        .navigationTitle(bucket.name)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            Task.init {
                await listViewModel.loadLists(bucketId: bucket.id)
            }
        }
    }
    
    private var lists: [Topic] {
        if case let .success(lists) = listViewModel.phase {
            return lists
        } else {
            return []
        }
    }
}

struct BucketDetails_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BucketDetails(bucket: Bucket.previewData[0])
        }
    }
}
