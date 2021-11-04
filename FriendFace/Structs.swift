//
//  Structs.swift
//  FriendFace
//
//  Created by Yash Poojary on 03/11/21.
//

import Foundation

struct Friend: Codable, Identifiable {
    var id: UUID
    var name: String
}


struct User: Codable, Identifiable {
    var id: UUID
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: String
    var tags: [String]
    var friends: [Friend]
}
