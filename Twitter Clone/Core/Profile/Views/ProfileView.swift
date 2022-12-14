//
//  ProfileView.swift
//  Twitter Clone
//
//  Created by Yatharth Dixit on 20/11/22.
//

import SwiftUI
import Kingfisher

struct ProfileView: View {
    @State private var selectedFilter : TweetFilterViewModel = .tweets
    
    @Namespace var animation
    @Environment(\.presentationMode) var mode

    @EnvironmentObject var authViewModel: AuthViewModel
    @EnvironmentObject var feedViewModel: FeedViewModel
    
    @ObservedObject var profileViewModel :  ProfileViewModel
    init(user: User){
        self.profileViewModel = ProfileViewModel(user:user)
        
    }
    
    var body: some View {
        VStack(alignment: .leading){
            headerView
            
            actionButton
            
            userInfoDetails
            
            tweetFilterBar
            
            tweetsView
            
            
            
            Spacer()
    }
        .navigationBarHidden(true)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User(id: NSUUID().uuidString,
                               username: "hdks",
                               fullname: "yath",
                               profileImageUrl: "",
                               email: "yath@gmail.com"))
         
    }
}
extension ProfileView{
    var headerView: some View{
        ZStack(alignment: .bottomLeading){
            Color(.systemBlue).ignoresSafeArea()
            VStack{
                Button{
                    mode.wrappedValue.dismiss()
                    
                }label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20, height:20)
                        .foregroundColor(.white)
                        .offset(x: 7, y: 5)
                }
                KFImage(URL(string: profileViewModel.user.profileImageUrl))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 72, height: 72)
                    .clipShape(Circle())
                    .offset(x:16, y:24)
                
                
            }
            
        }
        .frame(height: 96)
        
    }
    var actionButton : some View{
        HStack(spacing: 12){
            Spacer()
            Image(systemName: "bell.badge")
                .font(.title3)
                .padding(6)
                .overlay(Circle().stroke(Color.gray, lineWidth: 0.75))
            if(authViewModel.currentUser?.id == profileViewModel.user.id){
                Button{
                }label: {
                    
                    Text("Edit Profile")
                        .font(.subheadline)
                        .bold()
                        .frame(width: 120, height: 32)
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 0.75))
                        .foregroundColor(.black)
                        
                }
            }
            else{
                Button{
                }label: {
                    
                    Text("Follow")
                        .font(.subheadline)
                        .bold()
                        .frame(width: 120, height: 32)
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 0.75))
                        .foregroundColor(.black)
                    
                }
            }
            
        } .padding(.trailing)
    }
    
    var userInfoDetails  : some View{
        VStack(alignment: .leading, spacing: 4){
            HStack{
                Text(profileViewModel.user.fullname)
                    .font(.title2)
                    .bold()
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(Color(.systemBlue))
                
        }
            Text("@\(profileViewModel.user.username)")
                .font(.subheadline)
                .foregroundColor(.gray)
            Text("A Guy learning so many new things")
                .font(.subheadline)
                .padding(.vertical)
//                .foregroundColor(.gray)
            HStack(spacing : 25){
                HStack{
                    Image(systemName: "mappin.and.ellipse")
                    Text("Greater Noida")
                }
                
                HStack{
                    Image(systemName: "link")
                    Text("https://linktr.ee/yatharthdixit")
                }
            }
            .font(.caption)
            .foregroundColor(.gray)
            UserStatsView()
            .padding(.vertical)
            
        }
        .padding(.horizontal)
    }
    var tweetFilterBar : some View {
        HStack{
            ForEach(TweetFilterViewModel.allCases , id: \.rawValue){item in
                VStack{
                    Text(item.title)
                        .font(.subheadline)
                        .fontWeight(selectedFilter == item ? .semibold : .regular)
                        .foregroundColor(selectedFilter == item ? .black : .gray)
                    if selectedFilter == item{
                        Capsule()
                            .foregroundColor(Color(.systemBlue))
                            .frame(height: 3)
                            .matchedGeometryEffect(id: "filter", in: animation)
                    }
                    else{
                        Capsule()
                            .foregroundColor(.clear)
                            .frame(height: 3)
                    }
                }
                .onTapGesture {
                    withAnimation(.easeOut){
                        self.selectedFilter = item;
                    }
                }
            }
            
        }
        .overlay(Divider().offset(x:0, y:16))
        
    }
    var tweetsView : some View{
        ScrollView {
            LazyVStack{
                ForEach(profileViewModel.tweets){ tweet in
                    TweetRowView(tweet: tweet)
                        .padding()
                }
            }
        }
    }
}


