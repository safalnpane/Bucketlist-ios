//
//  BaseAPI.swift
//  Bucketlist-ios
//
//  Created by Safal Neupane on 30/10/2022.
//

import Foundation

struct BaseAPI<T: Codable> {
    private let baseURLString = "http://localhost:8000/bucket"
    private let token = "Token f53d23ddc6a459c29ece0aa7c20b130674238c2f"
    
    private let jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        return decoder
    }()
    
    // MARK - Fecth list of <T>
    func fetch(from path:String) async throws -> [T] {
        let finalURLString = baseURLString + path
        let url =  URL(string: finalURLString)!
        var request = URLRequest(url: url)
        request.setValue(token, forHTTPHeaderField: "Authorization")
        
        let (data, urlResponse) = try await URLSession.shared.data(for: request)
        
        guard let response = urlResponse as? HTTPURLResponse else {
            throw NSError(domain: "BASE API", code: -1, userInfo: [NSLocalizedDescriptionKey: "Cannot fetch the list"])
        }
        
        switch response.statusCode {
        case (200...299), (400...499):
            do {
                let apiResponse = try jsonDecoder.decode([T].self, from: data)
                return apiResponse
            } catch {
                print(error)
                let serverError = try jsonDecoder.decode(ServerError.self, from: data)
                print(serverError)
                throw NSError(domain: "BASE API", code: -1, userInfo: [NSLocalizedDescriptionKey: serverError.detail])
            }
        default:
            throw NSError(domain: "BASE API", code: -1, userInfo: [NSLocalizedDescriptionKey: "Server Error. Please try again later"])
        }
    }
    
    func create(from path:String, newDictObject: Dictionary<String, Any>) async throws -> T {
        let finalURLString = baseURLString + path
        let url =  URL(string: finalURLString)!
        var request = URLRequest(url: url)
        
        // Configure the request
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: newDictObject)
        } catch {
            print(error.localizedDescription)
        }
        request.httpMethod = "POST"
        request.setValue(token, forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let (data, urlResponse) = try await URLSession.shared.data(for: request)
        
        guard let response = urlResponse as? HTTPURLResponse else {
            throw NSError(domain: "BASE API", code: -1, userInfo: [NSLocalizedDescriptionKey: "Failed to create on the server"])
        }
        
        switch response.statusCode {
        case (200...299), (400...499):
            do {
                let apiResponse = try jsonDecoder.decode(T.self, from: data)
                return apiResponse
            } catch {
                print(error.localizedDescription)
//                let serverError = try jsonDecoder.decode(ServerError.self, from: data)
//                print(serverError)
                throw NSError(domain: "BASE API", code: -1, userInfo: [NSLocalizedDescriptionKey: error.localizedDescription])
            }
        default:
            throw NSError(domain: "BASE API", code: -1, userInfo: [NSLocalizedDescriptionKey: "Server Error. Please try again later"])
        }
    }
}
