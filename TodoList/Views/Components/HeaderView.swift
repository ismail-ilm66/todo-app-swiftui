//
//  HeaderView.swift
//  TodoList
//
//  Created by Dev on 26/11/2025.
//

import SwiftUI

struct HeaderView: View {
    let title: String
        let subtitle: String
        let backgroundColor: Color
    let angle : Double
    let yOffsetVal : CGFloat
    
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 0).foregroundColor(backgroundColor).rotationEffect(Angle(degrees: angle))
            
            VStack{
                Text(title).font(.system(size: 32)).bold().foregroundColor(Color.white)
                
                Text(subtitle).font(.system(size: 24)).foregroundColor(Color.white).bold()
            }.padding(.top,30)
        }.frame(width: UIScreen.main.bounds.width * 3 , height: 300).offset(y:yOffsetVal)
    }
}

#Preview {
    HeaderView(title: "Todo List", subtitle: "Get Things Done", backgroundColor: Color.pink , angle : 15  , yOffsetVal: 100)
}
