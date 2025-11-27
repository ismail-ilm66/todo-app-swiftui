//
//  TodoListApp.swift
//  TodoList
//
//  Created by Dev on 26/11/2025.
//

import SwiftUI
import FirebaseCore

@main
struct TodoListApp: App {
init(
    
)
    {
        FirebaseApp.configure();
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
