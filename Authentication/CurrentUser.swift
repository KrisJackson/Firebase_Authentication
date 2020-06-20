//
//  SignOut.swift
//
//  Created by Kristopher Jackson
//  Copyright © 2020 Kristopher Jackson. All rights reserved.
//

import Foundation
import Firebase

class CurrentUser {
    
    let user: User? = Auth.auth().currentUser
    
    static func doesExist(_ name: String = String.CurrentUser.doesExist.name) -> (User?, Bool) {
        guard let user = Auth.auth().currentUser else {
            Logging.log(type: .warning, location: name, message: String.CurrentUser.doesExist.logDoesNotExist)
            return (nil, false)
        }
        Logging.log(type: .success, location: name, message: String.CurrentUser.doesExist.logExists + user.uid + ".")
        return (user, true)
    }
    
    @discardableResult static func signOut(_ name: String = String.CurrentUser.signOut.name) -> Error {
        let (user, doesExist) = CurrentUser.doesExist()
        
        if doesExist {
            try! Auth.auth().signOut()
            Logging.log(type: .success, location: name, message: String.CurrentUser.signOut.logSignOut + user!.uid + ".")
            return Error.error(type: .none, text: String.CurrentUser.signOut.signOut + user!.uid + ".")
        } else {
            return Error.error(type: .none, text: String.CurrentUser.signOut.doesNotExist)
        }
    }
}
