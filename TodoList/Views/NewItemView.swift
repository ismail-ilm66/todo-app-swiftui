//
//  NewItemView.swift
//  TodoList
//
//  Created by Dev on 26/11/2025.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var newItemViewModel = NewItemViewModel()
    @Binding var newItemPresented : Bool
    
    var body: some View {
      VStack
        {
            // Title:
            Text("New Item").font(.system(size: 32)).bold().padding(.top,60)
            
            // Form:
            
            Form
            {
                //Title:
                
                TextField("Title" , text:$newItemViewModel.title).textFieldStyle(DefaultTextFieldStyle())
                
                // Date Picker:
                
                DatePicker("Due Date" , selection:  $newItemViewModel.dueDate).datePickerStyle(GraphicalDatePickerStyle())
                
                // Button:
                CustomButton(title: "Save", backgroundColor: .pink, onTap:
                                {
//                    newItemViewModel.save()
//                    newItemPresented = false
                    if newItemViewModel.canSave
                    {
                        newItemViewModel.save()
                        newItemPresented = false
                    }
                    else
                    {
                        return
                    }
                    
                })
            }
            
            
            
        }.alert(isPresented:$newItemViewModel.showAlert , content: {
                
                Alert(title: Text("Error") , message: Text("Please Fill All The Fields Correctly"))
            
            
            
        } )
    }
}

#Preview {
    NewItemView( newItemPresented:Binding(get: {
        return true
    }, set: { _ in }))
}
