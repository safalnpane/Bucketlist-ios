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
                    Text("Safal, Sulav, Kushal, Sijan, Ram, Sam")
                        .font(.caption)
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
            BucketDetails(bucket: Bucket(name: "Test bucket", description: "This is a test bucket description. This can be either long or very short description. I can still add more description texts."))
        }
    }
}
