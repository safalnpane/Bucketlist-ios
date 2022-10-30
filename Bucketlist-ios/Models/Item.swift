//
//  Item.swift
//  Bucketlist-ios
//
//  Created by Safal Neupane on 30/10/2022.
//

import Foundation

struct Item: Identifiable, Codable {
    let id: String
    let listName: String
    
    var value: String
    var tag: String
    var isCompleted: Bool
}
