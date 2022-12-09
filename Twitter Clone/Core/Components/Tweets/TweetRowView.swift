//
//  TweetRowView.swift
//  Twitter Clone
//
//  Created by Yatharth Dixit on 20/11/22.
//

import SwiftUI
import Kingfisher

struct TweetRowView: View {
    let tweet : Tweet
    
    var body: some View {
        VStack(alignment: .leading){
            if let user = tweet.user{
            
            //MARK: - Profile image, User Info & Tweet
            
            HStack(alignment: .top,spacing: 12){
                
                KFImage(URL(string: user.profileImageUrl))
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 56, height: 56)
                    .scaledToFit()
                
                // MARK: - User Info and Tweet captions
                VStack(alignment: .leading, spacing: 4){
                    // MARK: - User Info
                    
                    HStack{
                        Text(user.fullname)
                            .font(.subheadline).bold()
                        Text(user.username)
                            .foregroundColor(.gray)
                            .font(.caption)
                        Text("2w")
                            .foregroundColor(.gray)
                            .font(.caption)
                        
                    }
                    
                    
                    //MARK: - Tweets
                    Text(tweet.caption)
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                }
                
            }
            //MARK: - Action Buttons;
            HStack{
                Button{
                    //action here;
                } label: {
                    Image(systemName: "bubble.left")
                    
                }
                Spacer()
                Button{
                    
                }label:{
                    Image(systemName: "arrow.2.squarepath")
                }
                Spacer()
                Button{
                    
                }label: {
                    Image(systemName: "heart")
                }
                Spacer()
                Button{
                    
                }label: {
                    Image(systemName: "bookmark")
                }
                
                
            }
            .padding()
            .foregroundColor(.gray)
            Divider()
        }
        }
        
        .padding()
//        Divider()
        
    }
}

//struct TweetRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        TweetRowView()
//    }
//}
