//
//  TextArea.swift
//  Twitter Clone
//
//  Created by Yatharth Dixit on 21/11/22.
//

import SwiftUI

struct TextArea: View {
    @Binding var text : String
    let placeholder : String
    
    
    init(_ placeholder: String, text: Binding<String>){
        self.placeholder = placeholder
        self._text = text
        UITextView.appearance().backgroundColor = .clear
    }
    var body: some View {
        ZStack(alignment: .topLeading){
            
            
            
            TextEditor(text: $text)
                .padding(4)
                .font(.body)
            
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(Color(.gray))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 12)
            }
            
        }
    }
}

//struct TextArea_Previews: PreviewProvider {
//    static var previews: some View {
//    }
//}
