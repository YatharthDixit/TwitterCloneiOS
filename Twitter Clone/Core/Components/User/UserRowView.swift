//
//  UserRowView.swift
//  Twitter Clone
//
//  Created by Yatharth Dixit on 21/11/22.
//

import SwiftUI

struct UserRowView: View {
    var body: some View {
        HStack(spacing : 12){
            Circle()
                .frame(width: 48, height: 48)
            VStack(alignment: .leading){
                Text("yatharthdixit")
                    .font(.subheadline)
                    .bold() 
                    .foregroundColor(.black)
                Text("Yatharth Dixit")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
        
    }
}

struct UserRowView_Previews: PreviewProvider {
    static var previews: some View {
        UserRowView()
    }
}
