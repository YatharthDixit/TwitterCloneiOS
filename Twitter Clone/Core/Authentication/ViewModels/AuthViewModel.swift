//
//  AuthViewModel.swift
//  Twitter Clone
//
//  Created by Yatharth Dixit on 21/11/22.
//

import SwiftUI
import FirebaseStorage
import Firebase


class AuthViewModel: ObservableObject {
     private var tempUserSession: Firebase.User?
    @Published var userSession : Firebase.User?
    @Published var didUserAuthenticated  = false
    
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
           
            print("User is \(self.userSession)")
            self.tempUserSession = user
            
            let data = ["email":email,
                        "username": username.lowercased(),
                        "fullname":fullName,
                        "uid": user.uid]
            
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data) {_ in
                    self.didUserAuthenticated = true
                }
        }
        
    }
    func signOut(){
        //Sets user session to nil so we show loginView
        userSession = nil
        //signout from backend
        try?Auth.auth().signOut()
        
    }
    func uploadPhoto(selectedImage: UIImage){
        guard let uid = tempUserSession?.uid else {return}
        
        guard selectedImage != nil else {return}
        
        let storageRef = Storage.storage().reference()
        
        let imageData = selectedImage.jpegData(compressionQuality: 0.8)
        
        guard imageData != nil else {return}
        
        let imagePath = "ProfilePhotos/\(UUID().uuidString).jpg"
        
        let fileRef = storageRef.child(imagePath)
        
        let uploadTask = fileRef.putData(imageData!, metadata: nil){metadata,
            error in
            if error == nil && imageData != nil{
                Firestore.firestore().collection("users")
                    .document(uid)
                    .updateData([
                        "profileImageUrl" : imagePath
                    ])
                self.userSession = self.tempUserSession
            }
        }
    }
}
