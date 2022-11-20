//
//  TweetRowView.swift
//  Twitter Clone
//
//  Created by Yatharth Dixit on 20/11/22.
//

import SwiftUI

struct TweetRowView: View {
    var body: some View {
        VStack(alignment: .leading){
            //MARK: - Profile image, User Info & Tweet
            HStack(alignment: .top,spacing: 12){
                Circle()
                    .frame(width: 56, height: 56)
                    .foregroundColor(Color(.systemBlue))
                // MARK: - User Info and Tweet captions
                VStack(alignment: .leading, spacing: 4){
                    // MARK: - User Info
                    HStack{
                        Text("Yatharth Dixit")
                            .font(.subheadline).bold()
                        Text("@yatharthdixit")
                            .foregroundColor(.gray)
                            .font(.caption)
                        Text("2w")
                            .foregroundColor(.gray)
                            .font(.caption)
                        
                    }
                    //MARK: - Tweets
                    Text("Learn to Code.")
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
        
        .padding()
//        Divider()
        
    }
}

struct TweetRowView_Previews: PreviewProvider {
    static var previews: some View {
        TweetRowView()
    }
}
