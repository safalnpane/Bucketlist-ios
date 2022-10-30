//
//  List.swift
//  Bucketlist-ios
//
//  Created by Safal Neupane on 30/10/2022.
//

import Foundation

struct BucketList: Identifiable, Codable {
    let id: String
    let createdAt: Date
    let bucketName: String
    
    var name: String
    var updatedAt: Date
}
