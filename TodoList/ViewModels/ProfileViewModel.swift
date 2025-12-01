//
//  ProfileViewModel.swift
//  TodoList
//
//  Created by Dev on 01/12/2025.
//

import Foundation
import FirebaseAuth

class ProfileViewModel : ObservableObject
{
    
    init ()
    {
        
    }
    
    func logout ()
    {
        let authModel = Auth.auth()
        do
        {
          try authModel.signOut()
        }
        catch
        {
            print("Error occurred while logging out: \(error.localizedDescription)")
        }
        
        
    }
}
