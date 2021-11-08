//
//  DetailView.swift
//  FriendFace
//
//  Created by Yash Poojary on 07/11/21.
//

import SwiftUI

struct DetailView: View {
    var user: User
    
    var users: [User]
    
    var body: some View {
        
        List {
            Section(header: Text("Details")) {
                Text("Company: \(user.company)")
                        .font(.headline)

                Text(user.address)
                    .font(.title)
                
                Text(user.about)
            }
            
            Section(header: Text("Friends")) {
                ForEach(user.friends) { friend in
                    NavigationLink(destination: DetailView(user: users.first(where: {$0.id == friend.id})!, users: users) ) {
                    
                    Text(friend.name)
                }
                
            }
        }
        
            .navigationTitle(user.name)
        
        }
    }
}


