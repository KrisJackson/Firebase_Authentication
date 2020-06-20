//
//  Verification_Test.swift
//
//  Created by Kristopher Jackson
//  Copyright © 2020 Kristopher Jackson. All rights reserved.
//

import XCTest
import Firebase
@testable import <#Project Name#>

class Verification_Test: XCTestCase {

    func testEmptyEmail() {
        let email = ""
        let expectation = XCTestExpectation(description: "Verification_Test.testEmptyEmail")
            
        try! Auth.auth().signOut()
        Verification.send(toEmail: email) { (error) in
            
            XCTAssertNotEqual(error.type, Error.ErrorType.none)
            XCTAssertEqual(error.type, Error.ErrorType.weak)
            try! Auth.auth().signOut()
            expectation.fulfill()
            
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
//    func testFakeEmail() {
//        let email = ""
//        let expectation = XCTestExpectation(description: "Verification_Test.testEmptyEmail")
//
//        try! Auth.auth().signOut()
//        Verification.send(toEmail: email) { (error) in
//
//            XCTAssertNotEqual(error.type, Error.ErrorType.none)
//            XCTAssertEqual(error.type, Error.ErrorType.weak)
//            try! Auth.auth().signOut()
//            expectation.fulfill()
//
//        }
//        wait(for: [expectation], timeout: 10.0)
//    }

}
