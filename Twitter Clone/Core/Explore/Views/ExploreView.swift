//
//  ExploreView.swift
//  Twitter Clone
//
//  Created by Yatharth Dixit on 20/11/22.
//

import SwiftUI

struct ExploreView: View {
    @ObservedObject var usersViewModel = ExploreViewModel()
    
    var body: some View {
        
            VStack{
                SearchBarView(text: $usersViewModel.searchText)
                    .padding()
                ScrollView{
                    LazyVStack{
                        ForEach(usersViewModel.searchabeUsers){ user in
                            NavigationLink{
                                ProfileView(user: user)
                            }
                        label: {
                            UserRowView(user: user)
                        }
                        }
                    }
                }
            }
        
        .navigationTitle("Explore")
        .navigationBarTitleDisplayMode(.inline)
         
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
