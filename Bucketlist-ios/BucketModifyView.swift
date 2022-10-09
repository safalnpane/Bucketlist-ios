//
//  BucketModifyview.swift
//  Bucketlist-ios
//
//  Created by Safal Neupane on 9/10/2022.
//

import SwiftUI

struct BucketModifyView: View {
    @Binding var bucket: Bucket
    @State private var newInvite = ""
    
    var body: some View {
        List {
            Section(header: Text("Bucket Info")) {
                TextField("Bucket Name", text: $bucket.name)
                TextEditor(text: $bucket.description)
                    .frame(height: 80)
            }
            Section(header: Text("People")) {
                ForEach(bucket.people) { person in
                    Text(person.email)
                }
                .onDelete { indices in
                    bucket.people.remove(atOffsets: indices)
                }
                HStack {
                    TextField("Invite with Email", text: $newInvite)
                    Button(action: {
                        withAnimation {
                            let newPerson = Bucket.Person(email: newInvite)
                            bucket.people.append(newPerson)
                            newInvite = ""
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                    }
                    .disabled(newInvite.isEmpty)
                }
            }
        }
    }
}

struct BucketModifyview_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BucketModifyView(bucket: .constant(Bucket.sampleData[0]))
        }
    }
}
