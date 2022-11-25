//
//  ImageUploader.swift
//  Twitter Clone
//
//  Created by Yatharth Dixit on 24/11/22.
//

import FirebaseStorage
import FirebaseFirestore
//import FirebaseCore
import Firebase
import UIKit

//struct ImageUploader{
//    static func uploadImage(image: UIImage, comletion: @escaping(String) -> Void){
//        guard let imageData = image.jpegData(compressionQuality: 0.8) else{ return }
//        let filename = NSUUID().uuidString
//        let ref = Storage.storage().reference(withPath: "/profile_image/\(filename)")
//
//    
//        
//        ref.putData(imageData, metadata : nil){_, error in
//            if let error = error {
//                print("DeBUG: Failed to upload image with error: \(error.localizedDescription)")
//                return
//            }
//            
//            ref.downloadURL{ imageUrl, _ in
//                guard let imageUrl = imageUrl?.absoluteString else { return }
//                completion(imageUrl)
//                
//            }
//        }
//    }
//}
