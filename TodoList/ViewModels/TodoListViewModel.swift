//
//  TodoListViewModel.swift
//  TodoList
//
//  Created by Dev on 01/12/2025.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class TodoListViewModel : ObservableObject
{
    @Published var showingNewItemSheet : Bool = false
    
    
    init ()
    {
        
    }
    
    func deleteTodo( id: String) async
    {
        let db = Firestore.firestore()
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        
        do
        {
            try await  db.collection("users").document(userId).collection("todos").document(id).delete()
            
        }
        catch
        {
            print("Something Went Wron Deleting the Todo")
        }
        
        
    }
    
    func toggleDone (item: TodoModel) async
    {
       
        
        let db = Firestore.firestore()
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        do
        {
            try await  db.collection("users").document(userId).collection("todos").document(item.id).updateData(["isDone": !item.isDone])
            
        }
        catch
        {
            print("Something Went Wron Deleting the Todo")
        }
        
    }
}
