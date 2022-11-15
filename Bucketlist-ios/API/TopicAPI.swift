//
//  ListAPI.swift
//  Bucketlist-ios
//
//  Created by Safal Neupane on 30/10/2022.
//

import Foundation

struct TopicAPI {
    private var pathString = "/lists"
    private let baseAPI = BaseAPI<Topic>()
    
    func fetch(bucketId: String) async throws -> [Topic] {
        let finalUrlString = pathString + "/\(bucketId)"
        let topicResponse = try await baseAPI.fetch(from: finalUrlString)
        return topicResponse
    }
    
    func create(newTopic: String, bucketId: String) async throws -> Topic {
        let dictTopic: Dictionary<String, Any> = [
            "name": newTopic
        ]
        
        let topicResponse = try await baseAPI.create(from: pathString + "/\(bucketId)", newDictObject: dictTopic)
        return topicResponse
    }
}
