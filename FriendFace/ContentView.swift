//
//  ContentView.swift
//  FriendFace
//
//  Created by Yash Poojary on 03/11/21.
//

import SwiftUI

struct ContentView: View {
    @State private var users = [User]()
    

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(users, id: \.self) { user in
                        NavigationLink(destination: DetailView(user: user, users: users)) {
                            HStack {
                                Image(systemName: "person.crop.circle")
                                    .foregroundColor(Color.random)
                                    .font(.largeTitle)
                                VStack(alignment: .leading) {
                                    Text(user.name)
                                        .font(.headline)
                                    Text("Age: \(user.age)")
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Friend Face")
        }
        .onAppear(perform: loadData)
    }

    
    func loadData() {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("There was an error")
            return
        }
        
        let request = URLRequest(url: url)
        
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let userData = data {
                
                
                  let decoder = JSONDecoder()
                  decoder.dateDecodingStrategy = .iso8601
            
                
                if let decodedUsers = try? decoder.decode([User].self, from: userData) {
                    DispatchQueue.main.async {
                        users = decodedUsers
                    }
                    
                  return
                }
                
                
            }
            
            print("Fetch Failed: \(error?.localizedDescription ?? "NA")")
            
            
        }.resume()
        
    }
    

    
}


extension Color {
    static var random: Color {
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
