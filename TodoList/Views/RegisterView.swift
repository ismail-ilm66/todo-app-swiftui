//
//  RegisterView.swift
//  TodoList
//
//  Created by Dev on 26/11/2025.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var registerViewModel : RegisterViewModel = RegisterViewModel()
 
    var body: some View {
        VStack{
            // Header
            HeaderView(title: "Register" , subtitle: "Start Organizing Todos", backgroundColor:.orange,angle: -15, yOffsetVal: -150,)
            
            // Form:
            Form{
                //Error Text:
                if !registerViewModel.errorMessage.isEmpty
                    
                {
                    Text(registerViewModel.errorMessage).foregroundColor(.red)
                }
                
                
                TextField("Name" , text: $registerViewModel.name).textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
                TextField("Email" , text: $registerViewModel.email).textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.none)
                
                TextField("Password" , text:$registerViewModel.password).textFieldStyle(DefaultTextFieldStyle())
                
                CustomButton(title: "Register", backgroundColor: .orange, onTap: {
                    
                    Task {
                                await registerViewModel.register()
                            }
                }, isLoading: registerViewModel.isLoading)
            }
            
        }
    }
}

#Preview {
    RegisterView()
}
