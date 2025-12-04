//
//  ProfileViewModel.swift
//  TodoList
//
//  Created by Dev on 01/12/2025.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore


@MainActor
class ProfileViewModel : ObservableObject
{
    @Published var currentUser: UserModel?

    private var listener: ListenerRegistration?
    
    init ()
    {
        listenToCurrentUser()
        
    }
    
    private func listenToCurrentUser() {
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        
          listener = Firestore.firestore()
              .collection("users")
              .document(userId)
              .addSnapshotListener { document, error in
                  if let error = error {
                                 print("Error fetching user: \(error)")
                                 return
                             }
                  guard let document = document else { return }
                  
                  do {
                                 let user = try document.data(as: UserModel.self)
                                 self.currentUser = user
                             } catch {
                                 print("Error decoding user: \(error)")
                             }

                  
              }
      }
      
      deinit {
          listener?.remove()
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
