//
//  Tweer.swift
//  Twitter Clone
//
//  Created by Yatharth Dixit on 09/12/22.
//

import FirebaseFirestoreSwift
import Firebase

struct Tweet: Identifiable, Decodable{
    @DocumentID var id : String?
    let caption : String
    let timestamp : Timestamp
    let uid : String
    var likes : Int
    var user : User?
    
}

