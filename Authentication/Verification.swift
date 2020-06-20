//
//  Verification.swift
//
//  Created by Kristopher Jackson 
//  Copyright © 2020 Kristopher Jackson. All rights reserved.
//

import Foundation
import Firebase

class Verification {
    
    static func isVerified(_ name: String = String.Verification.isVerified.name, user: User = Auth.auth().currentUser!) -> (User, Bool) {
        var message: String!
        if user.isEmailVerified {
            message = String.Verification.isVerified.emailVerified
        } else {
            message = String.Verification.isVerified.emailNotVerified
        }
        
        Logging.log(type: .warning, location: name, message: message)
        return (user, user.isEmailVerified)
    }
    
    static func send(_ name: String = String.Verification.send.name, user: User = Auth.auth().currentUser!, completion: @escaping (Error) -> Void) {
        Logging.log(type: .start, location: name, message: String.Verification.send.logStart)
        
        user.sendEmailVerification { (error) in
            if let error = error {
                
                Logging.log(type: .system, location: name, message: error.localizedDescription)
                completion(Error.error(type: .system, text: error.localizedDescription))
                
            } else {
                
                Logging.log(type: .success, location: name, message: String.Verification.send.logSent + (user.email ?? "") + ".")
                completion(Error.error(type: .none, text: String.Verification.send.sent + "\(user.email ?? ""). " + String.Verification.send.spam))
                
            }
        }
    }
}
