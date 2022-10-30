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
}
