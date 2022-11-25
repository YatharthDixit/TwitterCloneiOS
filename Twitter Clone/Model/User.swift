//
//  User.swift
//  Twitter Clone
//
//  Created by Yatharth Dixit on 24/11/22.
//

import FirebaseFirestoreSwift

struct User : Identifiable{
    
    @DocumentID var id : String?
    let username : String
    let fullname : String
    let profileImageUrl : String
    let email : String
    
    
}
