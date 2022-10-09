//
//  BucketCardView.swift
//  Bucketlist-ios
//
//  Created by Safal Neupane on 9/10/2022.
//

import SwiftUI

struct BucketCardView: View {
    let bucket: Bucket
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(bucket.name)
                .font(.headline)
                .accessibilityAddTraits(.isHeader)
            Spacer()
            Text(bucket.description)
                .font(.caption)
        }
        .padding()
    }
}

struct BucketCardView_Previews: PreviewProvider {
    static var previews: some View {
        BucketCardView(bucket: Bucket.sampleData[0])
            .previewLayout(.sizeThatFits)
    }
}
