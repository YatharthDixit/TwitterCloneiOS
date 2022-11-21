//
//  CustomInputField.swift
//  Twitter Clone
//
//  Created by Yatharth Dixit on 21/11/22.
//

import SwiftUI

struct CustomInputField: View {
    let imageName : String
    let placeholderText : String
    @Binding var text : String
    var body: some View {
        VStack{
            HStack{
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.gray)
                    .frame(width: 20 , height: 20)
                
                TextField(placeholderText, text:$text)
                    
            }
            Divider()
                .background(Color(.gray))
        }
    }
}

struct CustomInputField_Previews: PreviewProvider {
    static var previews: some View {
        CustomInputField(imageName: "envelope", placeholderText: "Email", text: .constant(""))
    }
}
