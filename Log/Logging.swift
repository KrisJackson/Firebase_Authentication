//
//  Logging.swift
//
//  Created by Kristopher Jackson 
//  Copyright © 2020 Kristopher Jackson. All rights reserved.
//

import Foundation

class Logging {
    
    enum LogType {
        case fatal
        case system
        case warning
        case flag
        case success
        case start
    }
    
    @discardableResult static func log(type: LogType, location: String, message: String) -> String {
        var emoji: String = ""
        
        switch type {
        case .fatal:
            emoji = "  ❌  "
        case .system:
            emoji = "  ⚠️  "
        case .flag:
            emoji = "  🚨  "
        case .warning:
            emoji = "  ⚠️  "
        case .success:
            emoji = "  ✅  "
        case .start:
            emoji = "  ❇️  "
        }
        
        let log = " *** || \(emoji) || \(message) => \(location)"
        print(log)
        return log
    }
    
    @discardableResult static func wrapper(title: String, startMessage: String = "Starting process...", endMessage: String = "Finished process!", _ competion: @escaping () -> Error) -> Error {
        self.log(type: .start, location: title, message: "§§§ \(startMessage)")
        defer {
            self.log(type: .success, location: title, message: "§§§ \(endMessage)")
        }
        return competion()
    }
}
