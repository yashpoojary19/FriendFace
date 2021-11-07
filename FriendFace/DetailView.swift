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
        
        ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Company: \(user.company)")
                                .font(.headline)

                        Text(user.address)
                            .font(.title)
                        
                        Text(user.about)
                    }
                
                    
                        Text("Friends: ")
                            .foregroundColor(.green)
                            .font(.title)
                    
                        
                        ForEach(user.friends){ friend in
                            NavigationLink(destination: DetailView(user: users.first(where: {_ in
                                user.id == friend.id
                            }) ?? [, users: users)) {
                                Text(friend.name)
                            }
                        }
                            
                        Spacer()
                        
                    }
                .navigationTitle(user.name)
                .padding(.horizontal)
            }
        }




//
//struct DetailView_Previews: PreviewProvider {
//    static let user = User(from: <#Decoder#>)
//
//    static var previews: some View {
//        DetailView(user: users[1])
//    }
//}
