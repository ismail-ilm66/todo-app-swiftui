//
//  SwiftUIView.swift
//  TodoList
//
//  Created by Dev on 26/11/2025.
//

import SwiftUI

struct LoginView: View {
     
    @StateObject var loginViewViewModel : LoginViewViewModel = LoginViewViewModel()
    var body: some View {
    NavigationView
        {
            // Header:
          VStack
            {
                HeaderView(title: "Todo List", subtitle: "Get Things Done", backgroundColor: Color.pink , angle: 15,yOffsetVal: -100,)
                  
                  //Form:
                  Form
                  {
                      if !loginViewViewModel.errorMessage.isEmpty
                      {
                          Text(loginViewViewModel.errorMessage).foregroundColor(.red)
                      }
                      TextField("Email Address" , text: $loginViewViewModel.email).textFieldStyle(DefaultTextFieldStyle())
                          .autocorrectionDisabled()
                      
                      SecureField("Password" , text: $loginViewViewModel.password).textFieldStyle(DefaultTextFieldStyle())
                          .autocorrectionDisabled()
                          .textInputAutocapitalization(.none)
                      
                      CustomButton(title: "Login", backgroundColor: .pink, onTap: {
                          Task{
                             await loginViewViewModel.login()
                          }
                      }, isLoading: loginViewViewModel.isLoading
                      )
                   
                  }.padding(.all,16)
                  VStack
                  {
                      Text("New Around Here")
                      
                      NavigationLink("Create An Account" , destination: RegisterView()).padding(.bottom,50)
                  }
               


                
                  
                  Spacer()
            }
        }
    
    }
}

#Preview {
    LoginView()
}
