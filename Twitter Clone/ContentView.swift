//
//  ContentView.swift
//  Twitter Clone
//
//  Created by Yatharth Dixit on 20/11/22.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    @State private var showMenu = false
    @EnvironmentObject var authViewModel : AuthViewModel
    
    var body: some View {
        
        Group{
            if authViewModel.userSession == nil{
                LoginView()
            }
            else{
                mainInterfaceView
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ContentView()
        }
    }
}
extension ContentView{
    var mainInterfaceView : some View{
        
        
            ZStack(alignment: .topLeading){
                MainTabView()
                    .navigationBarHidden(showMenu)
                if showMenu{
                    ZStack{
                        Color(.black).opacity(showMenu ? 0.25 : 0.0)
                    }.onTapGesture {
                        withAnimation(.easeOut){
                            showMenu  = false;
                        }
                    }
                    .ignoresSafeArea()
                }
                SideMenuView()
                    .frame(width: 300)
                    .offset(x:showMenu ? 0 : -300, y:0)
                    .background(showMenu ? Color.white : Color.clear)
            }.navigationTitle("Home")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItem(placement: .navigationBarLeading){
                        if let user = authViewModel.currentUser{
                            Button{
                                withAnimation(.easeInOut){
                                    showMenu.toggle()
                                }
                                
                            }label: {
                                
                                KFImage(URL(string: user.profileImageUrl))
                                    .resizable()
                                    .clipShape(Circle())
                                    .scaledToFit()
                                    .frame(width: 48, height: 48)
                            }
                            
                        }
                    }
                }
                .onAppear{
                    showMenu = false;
                }
    }
}
