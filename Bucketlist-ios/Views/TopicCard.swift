//
//  TopicCard.swift
//  Bucketlist-ios
//
//  Created by Safal Neupane on 13/10/2022.
//

import SwiftUI

struct TopicCard: View {
    let topic: Topic
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("8 Tasks")
                .font(.caption)
            Spacer()
            Text(topic.title)
                .font(.headline)
                .foregroundColor(.accentColor)
            Spacer()
        }
        .padding()
    }
}

struct TopicCard_Previews: PreviewProvider {
    static var previews: some View {
        TopicCard(topic: Topic.sampleData[0])
            .previewLayout(.fixed(width: 200, height: 90))
    }
}
