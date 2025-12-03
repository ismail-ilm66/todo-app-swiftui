//
//  NewItemViewModel.swift
//  TodoList
//
//  Created by Dev on 01/12/2025.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

@MainActor
class NewItemViewModel : ObservableObject
{
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert : Bool = false
    @Published var isLoading : Bool = false
    @Published var errorMessage : String = ""
    
    
    
    init() {
        
    }
    
    func save () async
    {
        guard canSave else
            
        {
            return;
        }
        
        
        guard let userId = Auth.auth().currentUser?.uid else
        {
            print("No user Signed In")
            return
            
        }
        
        
        DispatchQueue.main.async(execute: {
            self.isLoading = true
        })
        defer
        {
            DispatchQueue.main.async(execute: {
                self.isLoading = false
            })
            
        }
        
        let newId = UUID().uuidString
        let newItem = TodoModel(id: newId, title: title, dueDate: dueDate.timeIntervalSince1970, createdAt: Date().timeIntervalSince1970, isDone: false)
        
        
       do
       {
           let db = Firestore.firestore()
           
        try await   db.collection("users").document(userId).collection("todos").document(newId).setData(newItem.asDictionary())
           
       }
        catch
        {
            DispatchQueue.main.async {
                self.errorMessage = error.localizedDescription
                 }
            print("Error Occured While Adding Todo Item")
        }
        
        
        
    }
    var canSave : Bool {
        
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else
        {
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else
        {
            return false
        }
        return true
    }
}
