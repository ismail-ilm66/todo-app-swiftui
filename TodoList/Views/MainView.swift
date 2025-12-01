//
//  ContentView.swift
//  TodoList
//
//  Created by Dev on 26/11/2025.
//

import SwiftUI


struct MainView: View {
    @StateObject var mainViewModel : MainViewViewModel = MainViewViewModel()
    
    var body: some View {
        
        if mainViewModel.isSignedIn &&  !mainViewModel.currentUserId.isEmpty
        {
            TabView
            {
                Tab("Home"  , systemImage: "house" )
                {
                    TodoListView()
                }
                Tab("Profile"  , systemImage: "person.circle" )
                {
                    ProfileView()
                }
            }
            
        }
        else
        {
            LoginView()
        }
        
    }
}

#Preview {
    MainView()
}
