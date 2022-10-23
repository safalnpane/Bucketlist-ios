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
    
    static let previewData = [
        Topic(title: "People", items: [
            Item(title: "Safal"),
            Item(title: "Sulav"),
            Item(title: "Kushal"),
            Item(title: "Sijan")
        ]),
        Topic(title: "Stays", items: [
            Item(title: "Haweli Hotel & Bar"),
            Item(title: "Lamjung Homestay"),
            Item(title: "Pokhara Hotel")
        ]),
        Topic(title: "Expenses", items: [
            Item(title: "Stays"),
            Item(title: "Travels"),
            Item(title: "Food"),
            Item(title: "First Aid")
        ])
    ]
    
    struct Item: Identifiable {
        let id: UUID = UUID()
        var title: String
        var isCompleted: Bool
        
        init(title: String, isCompleted: Bool = false) {
            self.title = title
            self.isCompleted = isCompleted
        }
    }
}
