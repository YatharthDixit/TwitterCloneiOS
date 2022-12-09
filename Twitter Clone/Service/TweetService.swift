//
//  TweetService.swift
//  Twitter Clone
//
//  Created by Yatharth Dixit on 09/12/22.
//

import Firebase
import FirebaseFirestore
struct TweetService{
    func uploadTweet(caption: String, completion: @escaping(Bool) -> Void){
        guard let uid = Auth.auth().currentUser?.uid else {return}
        let data = ["uid":uid,
                    "caption":caption,
                    "likes": 0,
                    "timestamp": Timestamp(date: Date())] as [String: Any]
        Firestore.firestore().collection("tweets")
            .document().setData(data){ error in
                if let error = error{
                    print("DEBUG: Failed to upload tweer : \(error.localizedDescription)")
                    completion(false)
                    return
                }
                else{
                    completion(true)
                }
            }
        
    }
    func fetchTweets(completion: @escaping([Tweet]) -> Void){
        var tweets = [Tweet]()
        Firestore.firestore().collection("tweets")
            .getDocuments{ snapshot, _ in
                guard let documents = snapshot?.documents else {return}
                let tweets = documents.compactMap( { try? $0.data(as: Tweet.self) } )
                completion(tweets)
            }
        }
    
}
