//
//  CustomButton.swift
//  TodoList
//
//  Created by Dev on 27/11/2025.
//

import SwiftUI

struct CustomButton: View {
    var title : String
    var backgroundColor : Color
    var onTap : () -> Void
    var isLoading: Bool = false
    var body: some View {
        Button{
            if !isLoading {
                            onTap()
                        }

            
        }label: {
          
                               ZStack{RoundedRectangle(cornerRadius: 10).foregroundColor(backgroundColor)
                                   if isLoading{
                                       ProgressView()
                                           .progressViewStyle(CircularProgressViewStyle())
                                   }  else
                                   {
                                       Text(title).foregroundColor(Color.white).bold()}
                               
                           }
           
        }.padding().disabled(isLoading)
    }
}

#Preview {
    CustomButton(
        title: "Title", backgroundColor: .pink, onTap: {}
    )
}
