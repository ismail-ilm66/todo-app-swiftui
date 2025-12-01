//
//  NewItemViewModel.swift
//  TodoList
//
//  Created by Dev on 01/12/2025.
//

import Foundation

class NewItemViewModel : ObservableObject
{
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert : Bool = false
    
    
    
    init() {
        
    }
    
    func save ()
    {
        guard canSave else
            
        {
            return;
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
