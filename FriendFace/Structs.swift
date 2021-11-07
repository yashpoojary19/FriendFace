//
//  Structs.swift
//  FriendFace
//
//  Created by Yash Poojary on 03/11/21.
//

import Foundation

struct Friend: Codable, Identifiable, Hashable {
    var id: UUID
    var name: String
}


struct User: Codable, Identifiable, Hashable {
    var id: UUID
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: Date
    var tags: [String]
    var friends: [Friend]
}
