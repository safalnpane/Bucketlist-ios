//
//  BucketCard.swift
//  Bucketlist-ios
//
//  Created by Safal Neupane on 13/10/2022.
//

import SwiftUI

struct BucketCard: View {
    let bucket: Bucket

    var body: some View {
        VStack {
            HStack(alignment: .center) {
                VStack(alignment: .leading) {
                    Text(bucket.name)
                        .font(.headline)
                        .foregroundColor(.accentColor)
                    Text(bucket.description)
                        .font(.caption)
                }
                Spacer()
                VStack {
                    Text("5")
                        .font(.largeTitle)
                    Label("\(bucket.owners.count + 1)", systemImage: "person")
                }
            }
            .padding()
        }
    }
}

struct BucketCard_Previews: PreviewProvider {
    static var previews: some View {
        BucketCard(bucket: Bucket.previewData[0])
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
