//
//  ExploreViewModel.swift
//  Twitter Clone
//
//  Created by Yatharth Dixit on 08/12/22.
//

import Foundation

class ExploreViewModel : ObservableObject{
    @Published var users = [User]()
    let service = UserService()
    
    init(){
        fetchUsers()
    }
    
    func fetchUsers(){
        service.fetchUsers { users in
            self.users = users
            print("DEBUG: Users \(users)")
        }
    }
}
