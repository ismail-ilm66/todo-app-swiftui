//
//  ProfileView.swift
//  TodoList
//
//  Created by Dev on 26/11/2025.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var profileViewModel : ProfileViewModel = ProfileViewModel()
    var body: some View {
        NavigationView{
            VStack
            {
                
            }.navigationTitle("Profile")
                .toolbar{
                    Button
                    {
                        // On Tap
                        profileViewModel.logout()
                    } label:
                    {
                        Image(systemName: "rectangle.portrait.and.arrow.right")
                    }
                    
                }
        }
    }
}

#Preview {
    ProfileView()
}
