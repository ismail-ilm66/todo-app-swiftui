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
    var body: some View {
        Button{
            onTap()
            
        }label: {
            ZStack{RoundedRectangle(cornerRadius: 10).foregroundColor(backgroundColor)
                Text(title).foregroundColor(Color.white).bold()
            }
        }.padding()
    }
}

#Preview {
    CustomButton(
        title: "Title", backgroundColor: .pink, onTap: {}
    )
}
