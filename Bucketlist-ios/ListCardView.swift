//
//  ListCardView.swift
//  Bucketlist-ios
//
//  Created by Safal Neupane on 9/10/2022.
//

import SwiftUI

struct ListCardView: View {
    let bucketList: BucketList
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(bucketList.name)
                .font(.headline)
            Spacer()
            Text(bucketList.description)
        }
        .padding()
    }
}

struct ListCardView_Previews: PreviewProvider {
    static var previews: some View {
        ListCardView(bucketList: BucketList.sampleData[0])
    }
}
