//
//  Topic.swift
//  Bucketlist-ios
//
//  Created by Safal Neupane on 13/10/2022.
//

import Foundation


struct Topic: Identifiable {
    let id: UUID = UUID()
    var title: String
    
    init(title: String) {
        self.title = title
    }
    
    static let sampleData = [
        Topic(title: "Expenses"),
        Topic(title: "Stays"),
        Topic(title: "Funds"),
        Topic(title: "Trips"),
    ]
}
