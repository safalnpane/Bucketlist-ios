//
//  NewBucketForm.swift
//  Bucketlist-ios
//
//  Created by Safal Neupane on 31/10/2022.
//

import SwiftUI

struct NewBucketForm: View {
    
    @Binding var newBucket: Bucket
    @State private var invitedOwners: [Bucket.Owner] = []
    @State private var newOwnerUsername = ""
    
    var body: some View {
        Form {
            Section(header: Text("Bucket Info")) {
                TextField("Bucket Name", text: $newBucket.name)
                TextEditor(text: $newBucket.description)
                    .frame(minHeight: 40)
                HStack {
                    Text("Created on")
                        .fontWeight(.bold)
                    Spacer()
                    Text(newBucket.created_at, style: .date)
                }
            }
            Section(header: Text("Invite friends")) {
                ForEach(newBucket.owners) { owner in
                    Text(owner.username)
                }
                HStack {
                    TextField("Friend's name", text: $newOwnerUsername)
                    Button(action: {
                        let newOwner = Bucket.Owner(username: newOwnerUsername)
                        newBucket.owners.append(newOwner)
                        newOwnerUsername = ""
                    }) { Image(systemName: "plus.circle.fill")}
                        .disabled(newOwnerUsername.isEmpty)
                }
            }
        }
    }
}

struct NewBucketForm_Previews: PreviewProvider {
    static var previews: some View {
        NewBucketForm(newBucket: .constant(Bucket()))
    }
}
