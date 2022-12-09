//
//  UploadTweetViewModel.swift
//  Twitter Clone
//
//  Created by Yatharth Dixit on 09/12/22.
//

import Foundation



class UploadTweetViewModel : ObservableObject{
    @Published var isTweetUploaded  = false
    let service = TweetService()
    
    func uploadTweet(withCaption caption: String){
        service.uploadTweet(caption: caption){
            success in
            if success{
                self.isTweetUploaded = true
            }
            else{
                //Show error
            }
        }
        
    }
}
