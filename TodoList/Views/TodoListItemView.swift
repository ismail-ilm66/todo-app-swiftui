//
//  TodoListItemView.swift
//  TodoList
//
//  Created by Dev on 26/11/2025.
//

import SwiftUI

struct TodoListItemView: View {
    let item : TodoModel
    let onToggle: () -> Void
    
   
    
    var body: some View {
        HStack
        {
            
            VStack(alignment: .leading)
            {
                Text(item.title).bold()
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                
                
            }
            Spacer()
            Button
            {
                onToggle()
                
            } label:
            {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
            }
        }
    }
}

#Preview {
    TodoListItemView(
        item:   TodoModel(id: "alskudiofa", title: "Test Todo", dueDate: Date().timeIntervalSince1970, createdAt: Date().timeIntervalSince1970, isDone: true), onToggle: {
            
        }
    )
}
