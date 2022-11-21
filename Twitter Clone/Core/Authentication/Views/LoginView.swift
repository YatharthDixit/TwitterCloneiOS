//
//  LoginView.swift
//  Twitter Clone
//
//  Created by Yatharth Dixit on 21/11/22.
//

import SwiftUI


struct LoginView: View {
    @State private var email  = ""
    @State private var password  = ""
    var body: some View {
        VStack{
            AuthHeaderView(title1: "Hello,", title2: "Welcome Back")
            VStack(spacing: 40){
             CustomInputField(imageName: "envelope", placeholderText: "Email", text: $email)
                CustomInputField(imageName: "lock", placeholderText: "Password", text: $password)
            }
            .padding(.horizontal, 32)
            .padding(.top, 44)
            
            HStack{
                Spacer()
                
                NavigationLink{
                Text("Reset Password View")
                }label: {
                    Text("Forgot Password?")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(Color(.systemBlue))
                        .padding(.top)
                        .padding(.trailing, 24)
                        
                    
                }
            }
            
            Button{
                print("sign in here")
            } label: {
                Text("Sign In")
                    .frame(width: 340, height: 50)
                    .font(.headline)
                    .foregroundColor(.white)
                    .background(Color(.systemBlue))
                    .clipShape(Capsule())
                    .padding()
            }
            .shadow(color: .gray.opacity(0.5), radius: 10, x:0, y :0)
            
            Spacer()
            
            NavigationLink{
                RegistrationView()
            }label: {
                HStack{
                    Text("Don't have an account?")
                        .font(.footnote)
                    Text("Sign Up")
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

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
