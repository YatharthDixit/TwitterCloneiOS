//
//  FeedView.swift
//  Twitter Clone
//
//  Created by Yatharth Dixit on 20/11/22.
//

import SwiftUI

struct FeedView: View {
    @State private var showNewTweetView = false
    
    var body: some View {
        ZStack (alignment: .bottomTrailing){
            ScrollView {
                LazyVStack{
                    ForEach(0 ... 20, id: \.self){
                        _ in TweetRowView()
                    }
                }
            }
            Button{
                showNewTweetView.toggle();
            }label: {
                Image("t1")
                    .resizable()
                    .frame(width: 50, height: 50)
                
                
            }
            .padding(20)
            .fullScreenCover(isPresented: $showNewTweetView){
                NewTweetView()
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
