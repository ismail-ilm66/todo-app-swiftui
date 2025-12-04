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
                Image(systemName: "person.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.blue)
                    .frame(width: 125 , height: 125)
                
                HStack
                {
                    
                    Text("Name: ")
                    Text(profileViewModel.currentUser?.name ?? "User")
                }
                HStack
                {
                    
                    Text("Email: ")
                    Text(profileViewModel.currentUser?.email ?? "Email")
                }
                HStack
                {
                    
                    Text("Member Since: ")
                    Text(Date( timeIntervalSince1970: profileViewModel.currentUser?.createdAt ?? Date().timeIntervalSinceNow).formatted(date: .abbreviated, time: .shortened))
                }
                Spacer()
                
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
