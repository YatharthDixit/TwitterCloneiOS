//
//  RegistrationView.swift
//  Twitter Clone
//
//  Created by Yatharth Dixit on 21/11/22.
//

import SwiftUI

struct RegistrationView: View {
    @State private var name: String = ""
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack{
            AuthHeaderView(title1: "Get Started,", title2: "Create your account")
            
            VStack(spacing: 40){
                CustomInputField(imageName: "person", placeholderText: "Name", text: $name)
                CustomInputField(imageName: "person", placeholderText: "Username", text: $username)
                CustomInputField(imageName: "envelope", placeholderText: "Email", text: $email)
                CustomInputField(imageName: "lock", placeholderText: "Password", text: $password)
            }
            .padding(.horizontal, 32)
            .padding(.top, 44)
            
            HStack{
                Spacer()
                
                
            }
            
            Button{
                print("sign in here")
            } label: {
                Text("Sign Up")
                    .frame(width: 340, height: 50)
                    .font(.headline)
                    .foregroundColor(.white)
                    .background(Color(.systemBlue))
                    .clipShape(Capsule())
                    .padding()
            }
            .shadow(color: .gray.opacity(0.5), radius: 10, x:0, y :0)
            
            Spacer()
            
            Button{
                presentationMode.wrappedValue.dismiss()
            }label: {
                HStack{
                    Text("Already have an account?")
                        .font(.footnote)
                    Text("Sign In")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                .foregroundColor(Color(.systemBlue))
                .padding(.bottom, 32)
            }
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
        
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}