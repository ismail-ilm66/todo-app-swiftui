//
//  TodoListView.swift
//  TodoList
//
//  Created by Dev on 26/11/2025.
//

import SwiftUI

struct TodoListView: View {
    @StateObject var todoListViewModel = TodoListViewModel()
    private let userId : String
    
    init( userId: String) {
        self.userId = userId
    }
    
    
    var body: some View {
        NavigationView{
            VStack
            {
                
            }.navigationTitle("Todo List")
                .toolbar{
                    Button 
                    {
                        // On Tap
                        todoListViewModel.showingNewItemSheet = true
                        
                    } label:
                    {
                        Image(systemName: "plus")
                    }
                    
                }.sheet(isPresented:$todoListViewModel.showingNewItemSheet, content: {
                    
                    NewItemView( newItemPresented: $todoListViewModel.showingNewItemSheet)
                })
        }
        
        
    }
}

#Preview {
    TodoListView(userId: "")
}
