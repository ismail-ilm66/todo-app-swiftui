//
//  TodoListView.swift
//  TodoList
//
//  Created by Dev on 26/11/2025.
//

import SwiftUI
import FirebaseFirestore

struct TodoListView: View {
    @StateObject var todoListViewModel = TodoListViewModel()
    @FirestoreQuery var items : [TodoModel]
    
    private let userId : String
    
    init( userId: String) {
        self.userId = userId
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
    }
    
    
    var body: some View {
        NavigationView{
            VStack
            {
                List(items)
                {
                    item in
                    
                    TodoListItemView(
                                      item: item,
                                      onToggle: {
                                         Task
                                          {
                                           await   todoListViewModel.toggleDone(item: item)
                                          }
                                      }
                                  ).swipeActions{
                       Button("Delete")
                        {
                            //Delete Functionality:
                            Task{
                              await  todoListViewModel.deleteTodo(id:  item.id)
                            }
                            
                            
                        }.tint(.red)
                    }
                    
                }.listStyle(PlainListStyle())
                
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
    TodoListView(userId: "LBz0TIpt7LS7GbsFPxdbnrWizmC3")
}
