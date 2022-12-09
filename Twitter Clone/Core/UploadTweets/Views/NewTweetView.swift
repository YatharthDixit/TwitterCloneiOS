//
//  NewTweetView.swift
//  Twitter Clone
//
//  Created by Yatharth Dixit on 21/11/22.
//

import SwiftUI
import Kingfisher

struct NewTweetView: View {
    @State private var caption = ""
    @Environment (\.presentationMode) var presentationMode
    @EnvironmentObject var authViewModel : AuthViewModel
    @ObservedObject var uploadTweetViewModel = UploadTweetViewModel()
    
    var body: some View {
        VStack{
            HStack{
                Button{
                    presentationMode.wrappedValue.dismiss()
                }label: {
                    Text("Cancel")
                        .foregroundColor(Color(.systemBlue))
                }
                
                Spacer()
                
                Button{
                    uploadTweetViewModel.uploadTweet(withCaption: caption)
                    
                    
                }label: {
                    Text("Tweet")
                        .bold()
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(Color(.systemBlue))
                        .foregroundColor(.white)
                        .clipShape(Capsule() )
                     
                }
                    
            }
            .padding()
            
            HStack(alignment: .top){
                if let user = authViewModel.currentUser{
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .frame(width:64, height:64)
                        .clipShape(Circle())
                }
                TextArea("What's happening?", text: $caption )
            }
            .padding()
        }
        .onReceive(uploadTweetViewModel.$isTweetUploaded) { success in
            if success{
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

struct NewTweetView_Previews: PreviewProvider {
    static var previews: some View {
        NewTweetView()
    }
}
