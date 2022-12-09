//
//  FeedViewModel.swift
//  Twitter Clone
//
//  Created by Yatharth Dixit on 09/12/22.
//

import Foundation

class FeedViewModel : ObservableObject{
    @Published var tweets = [Tweet]()
    let service = TweetService()
    let userService = UserService()
    
    init(){
        fetchTweets()
    }
    func fetchTweets(){
        service.fetchTweets{tweets in
            self.tweets = tweets
            for i in 0..<tweets.count{
                self.userService.fetchUser(withUid: tweets[i].uid) { user in
                    self.tweets[i].user = user
                }
            }
        }
    }
}
