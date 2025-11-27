//
//  RegisterView.swift
//  TodoList
//
//  Created by Dev on 26/11/2025.
//

import SwiftUI

struct RegisterView: View {
    @State var name  = ""
    @State var email = ""
    @State var password = ""
    var body: some View {
        VStack{
            // Header
            HeaderView(title: "Register" , subtitle: "Start Organizing Todos", backgroundColor:.orange,angle: -15, yOffsetVal: -120,)
            
            // Form:
            Form{
                TextField("Name" , text: $name)
                
                TextField("Email" , text: $email)
                
                TextField("Password" , text:$password)
                
                Button{
                    
                } label: {
                    
                    ZStack{RoundedRectangle(cornerRadius: 10).foregroundColor(Color.blue)
                        Text("Register").foregroundColor(Color.white).bold()
                    }
                }
            }
            
        }
    }
}

#Preview {
    RegisterView()
}
