//
//  ListViewModel.swift
//  Bucketlist-ios
//
//  Created by Safal Neupane on 30/10/2022.
//

import Foundation

@MainActor
class ListViewModel: ObservableObject {
    
    @Published var phase = DataFetchPhase<[BucketList]>.empty
    
    private let listAPI = ListAPI()
    
    init(lists: [BucketList]? = nil) {
        if let lists = lists {
            self.phase = .success(lists)
        } else {
            self.phase = .empty
        }
    }
    
    
    func loadLists(bucketId: String) async {
        phase = .empty
        do {
            let lists = try await listAPI.fetch(bucketId: bucketId)
            phase = .success(lists)
        } catch {
            phase = .failure(error)
        }
    }
}
