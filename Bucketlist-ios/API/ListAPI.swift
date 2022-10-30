//
//  ListAPI.swift
//  Bucketlist-ios
//
//  Created by Safal Neupane on 30/10/2022.
//

import Foundation

struct ListAPI {
    private var urlString = "http://localhost:8000/bucket/lists"
    private let token = "Token b72e35aa3fac9f743c5961c49f8ea7a83473716c"
    private let jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        return decoder
    }()
    
    func fetch(bucketId: String) async throws -> [BucketList] {
        let finalUrlString = urlString + "/\(bucketId)"
        let url = URL(string: finalUrlString)!
        var request = URLRequest(url: url)
        request.setValue(token, forHTTPHeaderField: "Authorization")
        let (data, urlResponse) = try await URLSession.shared.data(for: request)

        guard let response = urlResponse as? HTTPURLResponse else {
            throw NSError(domain: "List API", code: -1, userInfo: [NSLocalizedDescriptionKey: "Can not fetch Lists"])
        }
        
        switch response.statusCode {
        case (200...299), (400...499):
            let apiResponse = try jsonDecoder.decode([BucketList].self, from: data)
            return apiResponse
            
        default:
            throw NSError(domain: "List API", code: -1, userInfo: [NSLocalizedDescriptionKey: "Can not fetch Lists"])
        }
    }
}
