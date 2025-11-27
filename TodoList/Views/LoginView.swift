//
//  SwiftUIView.swift
//  TodoList
//
//  Created by Dev on 26/11/2025.
//

import SwiftUI

struct LoginView: View {
    @State var email = ""
    @State var password = ""
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
                      TextField("Email Address" , text: $email).textFieldStyle(DefaultTextFieldStyle())
                      SecureField("Password" , text: $password).textFieldStyle(DefaultTextFieldStyle())
                      Button{
                          
                      }label: {
                          ZStack{RoundedRectangle(cornerRadius: 10).foregroundColor(Color.blue)
                              Text("Sign In").foregroundColor(Color.white).bold()
                          }
                      }
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
