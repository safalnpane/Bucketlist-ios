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
    var items: [Item]
    
    init(title: String, items: [Item] = []) {
        self.title = title
        self.items = items
    }
    
    var completedItemsCount: Int {
        var count = 0
        for item in items {
            if item.isCompleted { count += 1 }
        }
        return count
    }
    
    static let sampleData = [
        Topic(title: "Expenses", items: Item.sampleData),
        Topic(title: "Stays", items: Item.sampleData),
        Topic(title: "Funds", items: [Item.sampleData[0], Item.sampleData[2], Item.sampleData[3]]),
        Topic(title: "Trips"),
    ]
    
    struct Item: Identifiable {
        let id: UUID = UUID()
        var title: String
        var isCompleted: Bool
        
        init(title: String, isCompleted: Bool = false) {
            self.title = title
            self.isCompleted = isCompleted
        }
        
        static let sampleData = [
            Item(title: "Call folks"),
            Item(title: "Plan Itenarary", isCompleted: true),
            Item(title: "Collect money"),
            Item(title: "Learn Swift")
        ]
    }
}
