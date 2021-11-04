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
        VStack {
            Text("\(users.count)")
                .padding()
        }
        .onAppear(perform: loadData)
    }
    
    func loadData() {
        
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
                print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
//
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            if let data = data {
//                if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
//                    DispatchQueue.main.async {
//                        self.results = decodedResponse.results
//                    }
//                    return
//                }
//
//
//            }
//
//            print("There was an error: \(error?.localizedDescription ?? "Unknown Error")")
//
//        }.resume()
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let userData = data else {
                print("No data in response: \(error?.localizedDescription ?? "Unkown Error")")
                return
            }
            
            let userDecoder = JSONDecoder()
            
            do {
                users = try userDecoder.decode([User].self, from: userData)
                return
            } catch {
                print("No data in response: \(error.localizedDescription)")
            }
            
            print("No data in response: \(error?.localizedDescription ?? "Unkown Error")")
            
        }.resume()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
