//
//  ItemAPI.swift
//  Bucketlist-ios
//
//  Created by Safal Neupane on 30/10/2022.
//

import Foundation

struct ItemAPI {
    private let pathString = "/items"
    private let baseAPI = BaseAPI<Item>()
    
    
    func fetch(topicId: String) async throws -> [Item] {
        let finalUrlString = pathString + "/\(topicId)"
        
        let itemList = try await baseAPI.fetch(from: finalUrlString)
        return itemList
    }
}
