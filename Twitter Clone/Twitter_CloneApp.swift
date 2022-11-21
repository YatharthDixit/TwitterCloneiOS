//
//  Twitter_CloneApp.swift
//  Twitter Clone
//
//  Created by Yatharth Dixit on 20/11/22.
//

import SwiftUI
import Firebase

@main
struct Twitter_CloneApp: App {
    @StateObject var authViewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ContentView()
                    
            }
            .environmentObject(authViewModel)
        }
    }
}
