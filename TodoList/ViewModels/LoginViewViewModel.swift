//
//  LoginViewViewModel.swift
//  TodoList
//
//  Created by Dev on 27/11/2025.
//

import Foundation
import FirebaseAuth

@MainActor
class LoginViewViewModel : ObservableObject
{
    
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    @Published var isLoading : Bool = false
    

    func login() async {
        guard validateLoginFields() else
        {
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


        do
        {
            _ = try await Auth.auth().signIn(withEmail: email, password: password)
        }
        catch
        {
            
            DispatchQueue.main.async {
                     self.errorMessage = error.localizedDescription
                 }

        }
        
        
        
    }
    
    private func validateLoginFields() -> Bool
    {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty else {
               
                errorMessage = "Email is missing"
                return false
            }

        guard !password.trimmingCharacters(in: .whitespaces).isEmpty else {
       
            errorMessage = "Password is missing"
                return false
            }
            // 2. Validate Password length
        guard password.count >= 8 else {
               errorMessage = "Password too short"
                return false
            }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Invalid Email"
            return false
        }
        
        return true
    }
}
