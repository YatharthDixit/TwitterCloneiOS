//
//  SearchBarView.swift
//  Twitter Clone
//
//  Created by Yatharth Dixit on 08/12/22.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var text : String
    @ObservedObject var usersViewModel = ExploreViewModel()
    var body: some View {
        HStack {
            TextField("Search...", text: $text)
                .padding (8)
                .padding (.horizontal, 24) .background(Color (.systemGray6))
                .cornerRadius (8)
                .overlay(
                    HStack {
                        Image (systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding (.leading, 8)
                        
                       
                        
                    }
                )
        }
        
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(text: .constant(""))
            .previewLayout(.sizeThatFits)
    }
}
