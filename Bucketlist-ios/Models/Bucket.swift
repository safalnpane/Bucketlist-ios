//
//  Bucket.swift
//  Bucketlist-ios
//
//  Created by Safal Neupane on 10/10/2022.
//

import Foundation


struct Bucket: Identifiable {
    let id: UUID = UUID()
    let createdAt: Date = Date()
    
    var updatedAt: Date
    var name: String
    var description: String
    var owners: [Owner]
    var topics: [Topic]
    
    init(name: String, description: String, topics: [Topic] = [], owners: [Owner] = []) {
        self.updatedAt = Date()
        self.name = name
        self.description = description
        self.owners = owners
        self.topics = topics
    }
    
    static let previewData = [
        Bucket(
            name: "Bucket - 1",
            description: "This is a first bucket, this bucket is for testing purpose only",
            topics: [Topic.previewData[0], Topic.previewData[1], Topic.previewData[2]],
            owners: [Owner.previewData[0], Owner.previewData[1]]
        ),
        Bucket(
            name: "Bucket - 2",
            description: "This is a second bucket, this bucket is for testing purpose only",
            topics: [Topic.previewData[2], Topic.previewData[1]],
            owners: [Owner.previewData[1]]
        ),
        Bucket(
            name: "Bucket - 3",
            description: "This is a third bucket, this bucket is for testing purpose only",
            topics: [Topic.previewData[1], Topic.previewData[0]]
        )
    ]
}

extension Bucket {
    struct Owner {
        let id: UUID = UUID()
        let name: String
        let username: String
        let email: String
        
        init(name: String, username: String, email: String) {
            self.name = name
            self.username = username
            self.email = email
        }
        
        static let previewData = [
            Owner(name: "Safal Neupane", username: "safalnpane", email: "safal.npane@gmail.com"),
            Owner(name: "Sulav Neupane", username: "sulavnpane", email: "sulav.npane@gmail.com"),
            Owner(name: "Kushal Poudel", username: "kushal", email: "kushal.poudel@gmail.com")
        ]
    }
}
