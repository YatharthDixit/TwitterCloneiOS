//
//  AuthViewModel.swift
//  Twitter Clone
//
//  Created by Yatharth Dixit on 21/11/22.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    @Published var userSession : User?
    init(){
        self.userSession = Auth.auth().currentUser
        print("DEBUG: user session is : \(self.userSession?.uid)")
    }
    func login(withEmail email: String, password : String){
        print("DEBUG LOGIN with EMAIL : \(email)")
        Auth.auth().signIn(withEmail: email, password: password){ result, error in
            if let error = error {
                print("DEBUG: Failed to signin with the error \(error.localizedDescription)")
                return
            }
            guard let user = result?.user else { return }
            self.userSession = user
            print("Logged in user")
        }
        
    }
    
    func register(withEmail email: String, password: String, fullName: String, username: String ){
//        print("DEBUG register with EMAIL: \(email)")
        Auth.auth().createUser(withEmail: email, password: password){result, error in
            
            if let error = error{
                print("DEBUG: Failed to register with the error \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
            print("User is \(self.userSession)")
            
            let data = ["email":email,
                        "username": username.lowercased(),
                        "fullname":fullName,
                        "uid": user.uid]
            
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data) {_ in
                    print("Did upload user data....")
                }
        }
        
    }
    func signOut(){
        //Sets user session to nil so we show loginView
        userSession = nil
        //signout from backend
        try?Auth.auth().signOut()
    }
}
