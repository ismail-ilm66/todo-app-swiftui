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
           
            accountView
        }
        else
        {
            LoginView()
        }
        
        
        
    }
    
    @ViewBuilder
    var accountView : some View
    {
        TabView
        {
            Tab("Home"  , systemImage: "house" )
            {
                TodoListView(userId: mainViewModel.currentUserId)
            }
            Tab("Profile"  , systemImage: "person.circle" )
            {
                ProfileView()
            }
        }
    }
}

#Preview {
    MainView()
}
