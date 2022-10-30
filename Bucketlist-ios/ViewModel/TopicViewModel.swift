//
//  ListViewModel.swift
//  Bucketlist-ios
//
//  Created by Safal Neupane on 30/10/2022.
//

import Foundation

@MainActor
class TopicViewModel: ObservableObject {
    
    @Published var phase = DataFetchPhase<[Topic]>.empty
    
    private let topicAPI = TopicAPI()
    
    init(topics: [Topic]? = nil) {
        if let topics = topics {
            self.phase = .success(topics)
        } else {
            self.phase = .empty
        }
    }
    
    
    func loadTopics(bucketId: String) async {
        phase = .empty
        do {
            let topics = try await topicAPI.fetch(bucketId: bucketId)
            phase = .success(topics)
        } catch {
            phase = .failure(error)
        }
    }
}
