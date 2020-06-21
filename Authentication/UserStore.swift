//
//  DataStore.swift
//
//  Created by Kristopher Jackson on 6/14/20.
//  Copyright © 2020 Kristopher Jackson. All rights reserved.
//

import Foundation
import Firebase

class UserStore {
    
    static func store(_ name: String = "UserStore.store", data: [String: Any], forUser user: User = Auth.auth().currentUser!, _ completion: @escaping (Error) -> Void) {
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
    
    static func doesDocumentExist(_ name: String = "UserStore.doesDocumentExist", forUser user: User, _ completion: @escaping (Bool?, Error) -> Void) {
        Logging.log(type: .start, location: name, message: "Checking if user exists...")
        
        Firestore.firestore().collection("users").document(user.uid).getDocument { (snapshot, error) in

            if let error = error {
                Logging.log(type: .system, location: name, message: error.localizedDescription)
                completion(nil, Error.error(type: .system, text: error.localizedDescription))
                return
            }
            
            guard let snapshot = snapshot else {
                Logging.log(type: .flag, location: name, message: "There seems to have been error retrieving the user.")
                completion(nil, Error.error(type: .system, text: "There seems to have been error retrieving the user."))
                return
            }
            
            completion(snapshot.exists, Error.error(type: .none, text: "Document successfully retrieved!"))
        }
    }

    
}

