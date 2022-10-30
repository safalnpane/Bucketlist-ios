//
//  Bucket.swift
//  Bucketlist-ios
//
//  Created by Safal Neupane on 30/10/2022.
//

import Foundation

struct Bucket: Identifiable, Codable {
    var id: String = ""
    var name: String = ""
    var description: String = ""
    var updated_at: Date = Date()
    var created_at: Date = Date()
    var owners: [Owner] = []
    
    static let previewData = [
        Bucket(id: "123", name: "Test Bucket 1", description: "This is a short description of the bucket. This tells people the importance of this bucket.", owners: Bucket.ownerData),
        Bucket(id: "124", name: "Test Bucket 2", description: "This is a short description of the bucket. This tells people the importance of this bucket.", owners: Bucket.ownerData),
        Bucket(id: "125", name: "Test Bucket 3", description: "This is a short description of the bucket. This tells people the importance of this bucket.", owners: Bucket.ownerData)
    ]
}

extension Bucket {
    struct Owner: Identifiable, Codable {
        var id: Int = 0
        var username: String = ""
        var first_name: String = ""
        var last_name: String = ""
    }
    
    static let ownerData = [
        Owner(id: 0, username: "safal", first_name: "Safal", last_name: "Neupane"),
        Owner(id: 1, username: "kushal", first_name: "Kushal", last_name: "Poudel"),
        Owner(id: 2, username: "sulav", first_name: "Sulav", last_name: "Neupane")
    ]
}
