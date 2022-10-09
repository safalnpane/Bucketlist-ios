//
//  BucketList.swift
//  Bucketlist-ios
//
//  Created by Safal Neupane on 9/10/2022.
//

import Foundation


struct BucketList: Identifiable {
    let id: UUID
    let name: String
    let description: String
    
    init(id: UUID = UUID(), name: String, description: String) {
        self.id = id
        self.name = name
        self.description = description
    }
}


extension BucketList {
    static let sampleData: [BucketList] =
    [
        BucketList(name: "First List", description: "This is a description for first list"),
        BucketList(name: "Second List", description: "This is a description for second list"),
        BucketList(name: "Third List", description: "This is a description for third list"),
        BucketList(name: "Fourth List", description: "This is a description for fourth list")
    ]
}
