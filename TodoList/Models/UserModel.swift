//
//  UserModel.swift
//  TodoList
//
//  Created by Dev on 26/11/2025.
//

import Foundation

class UserModel : Codable
{
    let id : String
    let name : String
    let email : String
    let createdAt : TimeInterval
    
    init(id: String, name: String, email: String, createdAt: TimeInterval) {
        self.id = id
        self.name = name
        self.email = email
        self.createdAt = createdAt
    }

    
}
