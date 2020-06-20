//
//  Login.swift
//
//  Created by Kristopher Jackson 
//  Copyright © 2020 Kristopher Jackson. All rights reserved.
//

import Foundation
import Firebase

class Login {
    static func login(_ name: String = String.Login.login.name, email e: String, password p: String, completion: @escaping (User?, Error) -> Void) {
        Logging.log(type: .success, location: name, message: String.Login.login.logStart)
        
        let email = e.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = p.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if email.isEmpty || password.isEmpty {
            Logging.log(type: .warning, location: name, message: String.Login.login.logEmptyFields)
            completion(nil, Error.error(type: .weak, text: String.Login.login.emptyFields))
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if let error = error {
                Logging.log(type: .system, location: name, message: error.localizedDescription)
                completion(Auth.auth().currentUser, Error.error(type: .system, text: error.localizedDescription))
                return
            }
            
            Logging.log(type: .success, location: name, message: String.Login.login.logSuccess)
            completion(Auth.auth().currentUser, Error.error(type: .none, text: String.Login.login.success))
            return
            
        }
    }
}

