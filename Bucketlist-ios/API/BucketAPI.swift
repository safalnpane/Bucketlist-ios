//
//  BucketAPI.swift
//  Bucketlist-ios
//
//  Created by Safal Neupane on 30/10/2022.
//

import Foundation

struct BucketAPI {
    private let baseAPI = BaseAPI<Bucket>()
    
    func fetch() async throws -> [Bucket] {
        let bucketResonse = try await baseAPI.fetch(from: "/")
        return bucketResonse
    }
    
    func create(newBucket: Bucket) async throws -> Bucket {
        let dictBucket: Dictionary<String, Any> = [
            "name": newBucket.name,
            "description": newBucket.description
        ]
        
        let bucketResponse = try await baseAPI.create(from: "/", newDictObject: dictBucket)
        return bucketResponse
    }
}
