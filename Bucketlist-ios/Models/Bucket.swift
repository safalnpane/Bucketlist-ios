//
//  Bucket.swift
//  Bucketlist-ios
//
//  Created by Safal Neupane on 9/10/2022.
//

import Foundation


struct Bucket: Identifiable {
    let id: UUID
    let name: String
    let description: String
    let createdDate: Date
    let lists: [BucketList]
    
    
    init(id: UUID = UUID(), name: String, description: String, createdDate: Date = Date(), lists: [BucketList] = []) {
        self.id = id
        self.name = name
        self.description = description
        self.createdDate = createdDate
        self.lists = lists
    }
}

extension Bucket {
    static let sampleData: [Bucket] =
    [
        Bucket(name: "ABC Trip Plan", description: "Let's plan a trip to ABC. It's gonna be a fun treak with friends.", lists: BucketList.sampleData),
        Bucket(name: "Sydney Boys Trip", description: "It's my dream to have a boys trip to Sydeny with my cousins."),
        Bucket(name: "Flight to Sydney", description: "I am going back to Sydney in 2 weeks time."),
    ]
}
