//
//  MainViewViewModel.swift
//  TodoList
//
//  Created by Dev on 28/11/2025.
//

import Foundation
import FirebaseAuth

class MainViewViewModel : ObservableObject
{
    @Published var currentUserId = ""
    private var handler : AuthStateDidChangeListenerHandle?
    
    init()
    {
        self.handler = Auth.auth().addStateDidChangeListener{ [weak self] _ , user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
        
        
    }
    
    public var isSignedIn : Bool {
        
        return Auth.auth().currentUser != nil
    }
}
