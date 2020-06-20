//
//  DataStore.swift
//
//  Created by Kristopher Jackson on 6/14/20.
//  Copyright © 2020 Kristopher Jackson. All rights reserved.
//

import Foundation
import Firebase

class UserStore {
    
    static func store(_ name: String = "DataStore.store", data: [String: Any], forUser user: User = Auth.auth().currentUser!, _ completion: @escaping (Error) -> Void) {
        Logging.log(type: .start, location: name, message: "Begin storing user data...")
        
        Firestore.firestore().collection("users").document(user.uid).setData(data, merge: true) { (error) in
            if let error = error {
                Logging.log(type: .system, location: name, message: error.localizedDescription)
                completion(Error.error(type: .system, text: error.localizedDescription))
                return
            }
            
            completion(Error.error(type: .weak, text: "User does not exist."))
            return
        }
    }
    
}

