//
//  ProfilePhotoSelectorView.swift
//  Twitter Clone
//
//  Created by Yatharth Dixit on 22/11/22.
//

import SwiftUI
import FirebaseStorage

struct ProfilePhotoSelectorView: View {
    @State private var showImagePicker = false
    @State private var selectedImage : UIImage?
    @State private var profileImage : Image?
    @EnvironmentObject var authViewModel : AuthViewModel
    var body: some View {
        VStack{
            AuthHeaderView(title1: "Set Up account", title2: "Add a profile photo")
           
            
            
            
                Button{
                    showImagePicker.toggle()
                }label: {
                    if let profileImage = profileImage{
                        profileImage
                            .resizable()
                            .frame(width: 200,height: 200)
                            .clipShape(Circle())
                        
                            
                    }
                    else{
                        Image("upload")
                            .resizable()
                            .frame(width: 60, height: 60)
                        
                    }
                }
                
            
                .sheet(isPresented: $showImagePicker, onDismiss: loadImage){
                    ImagePicker(selectedImage:$selectedImage)
                }
                .padding(.top, 50)
            Spacer()
            if  let selectedImage = selectedImage {
                Button{
                    authViewModel.uploadPhoto(selectedImage)
                    
                } label: {
                    Text("Continue")
                        .frame(width: 340, height: 50)
                        .font(.headline)
                        .foregroundColor(.white)
                        .background(Color(.systemBlue))
                        .clipShape(Capsule())
                        .padding(.bottom, 40)
                }
            }
            
                
            
            
        }
        .ignoresSafeArea()
    }
    func loadImage(){
        guard let selectedImage = selectedImage else {return}
        profileImage = Image(uiImage: selectedImage)
    }
    

}



//private struct profileImageModifier : ViewModifier{
//
//}

struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}
