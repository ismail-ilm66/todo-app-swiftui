//
//  TodoModel.swift
//  TodoList
//
//  Created by Dev on 26/11/2025.
//

import Foundation

struct TodoModel : Identifiable , Codable
{
    let id : String
    let title : String
    let dueDate : TimeInterval
    let createdAt : TimeInterval
    var isDone : Bool
    
    init(id: String, title: String, dueDate: TimeInterval, createdAt: TimeInterval , isDone : Bool) {
        self.id = id
        self.title = title
        self.dueDate = dueDate
        self.createdAt = createdAt
        self.isDone = isDone
    }
    
    mutating func setDone (_ state : Bool)
    {
        isDone = state
        
    }

    
}
