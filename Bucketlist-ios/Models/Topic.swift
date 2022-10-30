//
//  List.swift
//  Bucketlist-ios
//
//  Created by Safal Neupane on 30/10/2022.
//

import Foundation

struct Topic: Identifiable, Codable {
    var id: String = ""
    var created_at: Date = Date()
    var bucket_name: String = ""
    var name: String = ""
    var updated_at: Date = Date()
}
