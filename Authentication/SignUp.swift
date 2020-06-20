//
//  SignUp.swift
//
//  Created by Kristopher Jackson 
//  Copyright © 2020 Kristopher Jackson. All rights reserved.
//

import Foundation
import Firebase

class SignUp {
    
    static func signUp(_ name: String = String.SignUp.signUp.name, withEmail e: String, password p: String, confirmPassword c: String, ofType exts: [String] = [], completion: @escaping (User?, Error) -> Void) {
        Logging.log(type: .success, location: name, message: String.SignUp.signUp.logStart)
        
        let email = e.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = p.trimmingCharacters(in: .whitespacesAndNewlines)
        let confirm = c.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if email.isEmpty || password.isEmpty || confirm.isEmpty {
            Logging.log(type: .warning, location: name, message: String.SignUp.signUp.emailEmpty)
            completion(nil, Error.error(type: .weak, text: String.SignUp.signUp.emailEmpty))
            return
        }
        
        if (password != confirm) {
            Logging.log(type: .warning, location: name, message: String.SignUp.signUp.matchPasswords)
            completion(nil, Error.error(type: .weak, text: String.SignUp.signUp.matchPasswords))
            return
        }
        
        let forceExt = forceExtentsion(email: email, extensions: exts)
        if forceExt.type != .none {
            completion(nil, forceExt)
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if let error = error {
                Logging.log(type: .system, location: name, message: error.localizedDescription)
                completion(Auth.auth().currentUser, Error.error(type: .system, text: error.localizedDescription))
                return
            }
            
            Logging.log(type: .success, location: name, message: String.SignUp.signUp.success)
            completion(Auth.auth().currentUser, Error.error(type: .none, text: String.SignUp.signUp.success))
            return
        }
    }
    
    static private func forceExtentsion(_ name: String = String.SignUp.forceExtentsion.name, email e: String, extensions exts: [String] = []) -> Error {
        return Logging.wrapper(title: name, startMessage: String.SignUp.forceExtentsion.logStart, endMessage: String.SignUp.forceExtentsion.logEnd) {
            let email = e.trimmingCharacters(in: .whitespacesAndNewlines)
            let emailExtension = getExtension(email: email)
            
            if exts.isEmpty {
                Logging.log(type: .flag, location: name, message: String.SignUp.forceExtentsion.noExt)
                return Error.error(type: .none, text: String.SignUp.forceExtentsion.noExt)
            }
            
            if exts.contains(emailExtension) {
                
                Logging.log(type: .success, location: name, message: String.SignUp.forceExtentsion.success)
                return Error.error(type: Error.ErrorType.none, text: String.SignUp.forceExtentsion.success)
                
            } else {
                
                Logging.log(type: .warning, location: name, message: String.SignUp.forceExtentsion.badExt)
                return Error.error(type: .weak, text: String.SignUp.forceExtentsion.badExt)
                
            }
        }
    }
    
    static private func getExtension(email: String) -> String {
        var e = ""
        for (_, c) in email.enumerated() {
            if (c == "@") || (e.count > 0) {
                e.append(c)
            }
        }
        return e
    }
    
}
