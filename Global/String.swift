//
//  String.swift
//
//  Created by Kristopher Jackson 
//  Copyright © 2020 Kristopher Jackson. All rights reserved.
//

import Foundation

// Login API
extension String {
    
    class Login {
        
        struct login {
            static let name = "Login.login"
            static let logStart = "Begin authentication..."
            static let success = "User has successfully logged in!"
            static let emptyFields = "All fields must be completed!"
        }
        
    }
    
}

// Verification API
extension String {
    
    class Verification {
        
        struct isVerified {
            static let name = "Verification.isVerified"
            static let emailVerified = "User email verified!"
            static let emailNotVerified = "User email is not verified"
        }
        
        struct send {
            static let name = "Verification.send"
            static let logStart = "Begin verification..."
            static let logSent = "Verification email successfully sent to "
            static let spam =  "Be sure to check you spam folder and click the link in the email."
            static let sent = "A verification email has been sent to "
        }
        
    }
    
}

// Sign Up API
extension String {
    
    class SignUp {
        
        struct signUp {
            static let name = "SignUp.signUp"
            static let logStart = "Creating user..."
            static let emailEmpty = "All fields must be filled!"
            static let matchPasswords = "Passwords do not match"
            static let success = "Account created!"
        }
        
        struct forceExtentsion {
            static let name = "SignUp.forceExtentsion"
            static let logStart = "Checking extension..."
            static let logEnd =  "Done checking extension!"
            static let noExt = "No extension given"
            static let success = "This email is supported!"
            static let badExt = "This email address is not supported."
        }
        
    }
    
}

// Current User API
extension String {
    
    class CurrentUser {
        
        struct doesExist {
            static let name = "CurrentUser.doesExist"
            static let doesNotExist = "User does not exist."
            static let exists = "User exists with id "
        }
        
        struct signOut {
            static let name = "CurrentUser.signOut"
            static let signOut = "Successfully signed out user with id"
            static let doesNotExist = "User does not exist."
        }
        
    }
    
}

// Current User API
extension String {
    
    class UserStore {
        
        struct store {

            // TODO: Finish

        }
        
    }
    
}
