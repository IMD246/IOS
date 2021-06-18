//
//  AppLearningEnglishTests.swift
//  AppLearningEnglishTests
//
//  Created by CNTT on 5/10/21.
//  Copyright © 2021 fit.tdc.vn. All rights reserved.
//

import XCTest
@testable import AppLearningEnglish

class AppLearningEnglishTests: XCTestCase {

    //MARK: when user register a account and this is Success.
    func testRegisterAccountSuccess() {
        let user = User.init(name: "Sinh", user: "SinhDo", gender: "Male", age: 20, phone: "0123456789", point: 2)
        let user1 = User.init(name: "Sinh", user: "SinhDo", gender: "Male", age: 20, phone: "0", point: 2)
        XCTAssertNotNil(user1)
    }
    //MARK: when user register a account and this is fail.
    func testRegisterAccountFail() {
        //when creating a account but name is null
        let user1 = User.init(name: "", user: "SinhDo", gender: "Male", age: 20, phone: "0123456789", point: 2)
        //when creating a account but name and username are null
        let user2 = User.init(name: "", user: "", gender: "Male", age: 20, phone: "0123456789", point: 2)
        //when creating a account but name, username and gender is null
        let user3 = User.init(name: "", user: "", gender: "", age: 20, phone: "0123456789", point: 2)
        //when creating a account but name, username, gender and phone is null
        let user4 = User.init(name: "", user: "", gender: "", age: 20, phone: "", point: 2)
        //when creating a account but name, username, gender, phone is null and age is less than 1
        let user5 = User.init(name: "", user: "", gender: "", age: 0, phone: "", point: 2)
        //when creating a account but name, username, gender, phone is null and age, point is not invalid
        let user6 = User.init(name: "", user: "", gender: "", age: 0, phone: "", point: -1)
        //when creating a account but username is null
        let user7 = User.init(name: "Sinh", user: "", gender: "Male", age: 20, phone: "0123456789", point: 2)
        //when creating a account but gender is null
        let user8 = User.init(name: "Sinh", user: "SinhDo", gender: "", age: 20, phone: "0123456789", point: 2)
        //when creating a account but phone is null
        let user9 = User.init(name: "Sinh", user: "SinhDo", gender: "Male", age: 20, phone: "", point: 2)
        //when creating a account but age is not invalid
        let user10 = User.init(name: "Sinh", user: "SinhDo", gender: "Male", age: 0, phone: "0123456789", point: 1)
        XCTAssertNil(user10)
    }

}
