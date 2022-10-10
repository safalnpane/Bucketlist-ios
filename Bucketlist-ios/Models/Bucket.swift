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
    
    // MARK: - Internal init
    init(name: String, description: String = "") {
        self.id = UUID()
        self.createdAt = Date()
        self.updatedAt = Date()
        
        self.name = name
        self.description = description
    }
    
    // MARK: - Internal Data struct
    struct Data {
        var name: String = ""
        var description: String = ""
    }
    
    // MARK: - Computed data property
    var data: Data {
        Data(name: name, description: description)
    }
    
    // MARK: - Mutating func update
    
}
