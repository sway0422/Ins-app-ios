//
//  AuthManager.swift
//  Instagram
//
//  Created by Wei Si on 8/17/21.
//

import Foundation
import FirebaseAuth

public class AuthManager {
    
    static let shared = AuthManager()
    
    // MARK: Public
    public func registerNewUser(username: String, email: String, password: String) {
        
    }
    
    public func loginUser(username: String, email: String?, password: String) {
        
    }
    
    public func isUserLoggedIn() -> Bool {
        return Auth.auth().currentUser != nil
    }
    
}
