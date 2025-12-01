//
//  RegisterViewModel.swift
//  TodoList
//
//  Created by Dev on 28/11/2025.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewModel : ObservableObject
{
    
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    func register () async
    {
        guard validateRegisterFields() else
        {
            return
        }
        
        do
        {
            let result =     try  await  Auth.auth().createUser(withEmail: email, password: password)
            let uid = result.user.uid
            print("This is the userId" ,uid)
            let user  = UserModel(id: uid, name: name, email: email, createdAt: Date().timeIntervalSince1970,)
            
            let db = Firestore.firestore()
            try await db.collection("users").document(uid).setData(user.asDictionary())
            

            
        }
        catch
        {
            
        }
        
    }
    
    private func validateRegisterFields() -> Bool
    {
        errorMessage = ""
        
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty else {
               
                errorMessage = "Email is missing"
                return false
            }
        
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
