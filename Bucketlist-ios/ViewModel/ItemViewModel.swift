//
//  ItemViewModel.swift
//  Bucketlist-ios
//
//  Created by Safal Neupane on 30/10/2022.
//

import Foundation

@MainActor
class ItemViewModel: ObservableObject {
    
    @Published var phase = DataFetchPhase<[Item]>.empty
    
    private let itemAPI = ItemAPI()
    
    init(items: [Item]? = nil) {
        if let items = items {
            self.phase = .success(items)
        } else {
            self.phase = .empty
        }
    }
    
    
    func loadItems(topicId: String) async {
        phase = .empty
        do {
            let items = try await itemAPI.fetch(topicId: topicId)
            phase = .success(items)
        } catch {
            phase = .failure(error)
        }
    }
}
