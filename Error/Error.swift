//
//  Error.swift
//
//  Created by Kristopher Jackson 
//  Copyright © 2020 Kristopher Jackson. All rights reserved.
//

import Foundation

class Error {
    
    var text: String? = nil
    var type: ErrorType = .undefined
    
    enum ErrorType {
        // No error present
        case none
        // Error thrown by third party API
        case system
        // Non-fatal error that should be handled by UI
        case weak
        // Fatal error. Should crash program
        case fatal
        // Default of no error is defined. Should be handled
        case undefined
    }
    
    static func error(type: ErrorType = .undefined, text: String? = nil) -> Error {
        let err = Error()
        err.type = type
        err.text = text
        return err
    }
}
