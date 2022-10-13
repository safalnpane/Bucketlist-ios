//
//  Bucket.swift
//  Bucketlist-ios
//
//  Created by Safal Neupane on 10/10/2022.
//

import Foundation


struct Bucket: Identifiable {
    
    // MARK: - Internal types
    let id: UUID
    let createdAt: Date
    
    var updatedAt: Date
    var name: String
    var description: String
    var owners: [Owner]
    var topics: [Topic] = []
    
    // MARK: - Internal init
    init(name: String, description: String = "", owners: [Owner] = [], topics: [Topic] = []) {
        self.id = UUID()
        self.createdAt = Date()
        self.updatedAt = Date()
        
        self.name = name
        self.description = description
        self.owners = owners
        self.topics = topics
    }
    
    static let sampleData = [
        Bucket(name: "Bucket 1",
               description: "This is bucket 1. This is a short description of this bucket. This could include a length restriction",
               owners: [Owner.owners[0], Owner.owners[1], Owner.owners[2]],
               topics: [Topic.sampleData[0], Topic.sampleData[1], Topic.sampleData[2]]),
        Bucket(name: "Bucket 2", description: "This is bucket 2", owners: [Owner.owners[2], Owner.owners[1]]),
        Bucket(name: "Bucket 3", description: "This is bucket 3", owners: [Owner.owners[0]]),
        Bucket(name: "Bucket 4", description: "This is bucket 4", topics: [Topic.sampleData[0], Topic.sampleData[1]])
        
    ]
    
    struct Owner {
        let id: UUID = UUID()
        var name: String
        var username: String
        
        init(name: String, username: String) {
            self.name = name
            self.username = username
        }
        
        static let owners = [
            Owner(name: "Safal Neupane", username: "safalnpane"),
            Owner(name: "Sulav Neupane", username: "sulav"),
            Owner(name: "Kushal Neupane", username: "kushal"),
        ]
    }
}
