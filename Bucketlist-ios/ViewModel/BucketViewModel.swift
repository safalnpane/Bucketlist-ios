//
//  BucketViewModel.swift
//  Bucketlist-ios
//
//  Created by Safal Neupane on 30/10/2022.
//

import Foundation

enum DataFetchPhase<T> {
    case empty
    case success(T)
    case failure(Error)
}


@MainActor
class BucketViewModel: ObservableObject {
    
    @Published var phase = DataFetchPhase<[Bucket]>.empty
    
    private let bucketAPI = BucketAPI()
    
    init(buckets: [Bucket]? = nil) {
        if let buckets = buckets {
            self.phase = .success(buckets)
        } else {
            self.phase = .empty
        }
    }
    
    
    func loadBuckets() async {
        phase = .empty
        do {
            let buckets = try await bucketAPI.fetch()
            phase = .success(buckets)
        } catch {
            phase = .failure(error)
        }
    }
}
