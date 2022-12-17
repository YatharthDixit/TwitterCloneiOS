//
//  ProfileViewModel.swift
//  Twitter Clone
//
//  Created by Yatharth Dixit on 11/12/22.
//

import Foundation

class ProfileViewModel: ObservableObject{
    
    @Published var tweets = [Tweet]()
    private let service = TweetService()
    let user : User
  
    
    init(user : User){
        self.user = user
        self.fetchUserTweets()
        
    }
    
    func fetchUserTweets(){
        service.fetchTweets(forUid: user.id ?? "") { tweets in
            self.tweets = tweets
            for i in 0..<tweets.count{
                self.tweets[i].user = self.user
            }
        }
    }
}
