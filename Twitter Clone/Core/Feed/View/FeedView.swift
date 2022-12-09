//
//  FeedView.swift
//  Twitter Clone
//
//  Created by Yatharth Dixit on 20/11/22.
//

import SwiftUI

struct FeedView: View {
    @State private var showNewTweetView = false
    @ObservedObject var feedViewModel = FeedViewModel()
    
    
    
    var body: some View {
        ZStack (alignment: .bottomTrailing){
            ScrollView {
                LazyVStack{
                    ForEach(feedViewModel.tweets){ tweet in
//                      
                        TweetRowView(tweet: tweet)
//                      var us
                            
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

//struct FeedView_Previews: PreviewProvider {
//    static var previews: some View {
//        FeedView()
//    }
//}
