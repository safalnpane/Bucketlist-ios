//
//  BucketDetails.swift
//  Bucketlist-ios
//
//  Created by Safal Neupane on 30/10/2022.
//

import SwiftUI

struct BucketDetails: View {
    let bucket: Bucket
    
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
                
            }
        }
        .navigationTitle(bucket.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct BucketDetails_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BucketDetails(bucket: Bucket.previewData[0])
        }
    }
}
