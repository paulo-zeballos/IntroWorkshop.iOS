//
//  AccountModelTests.swift
//  IntroWorkshopTests
//
//  Created by Ken Ko on 3/12/2015.
//  Copyright © 2015 Commonwealth Bank of Australia. All rights reserved.
//

import XCTest
@testable import IntroWorkshop

class AccountModelTests: XCTestCase {

    func testThatMaskedAccountNumberIsCorrect() {
        let account = Account(accountName: "a", accountNumber: "12347890", availableFunds: 12.34, accountBalance: 34.56)
        XCTAssertEqual(account.maskedAccountNumber, "XXXX7890")
    }

    func testThatMaskedAccountNumberForShortNumberIsUnchanged() {
        let account = Account(accountName: "a", accountNumber: "1234", availableFunds: 12.34, accountBalance: 34.56)
        XCTAssertEqual(account.maskedAccountNumber, "1234")
    }

    func testThatAccountParsingIsCorrect() {
        let json: JSON = [
            "accountName": "a",
            "accountNumber": "123",
            "availableFunds": 12.34,
            "accountBalance": 34.56
        ]
        let account = Account(json: json)!
        XCTAssertEqual(account.accountName, "a")
        XCTAssertEqual(account.accountNumber, "123")
        XCTAssertEqual(account.availableFunds, 12.34)
        XCTAssertEqual(account.accountBalance, 34.56)
    }

    func testThatBadJsonReturnsNil() {
        let json: JSON = [
            "accountNameX": "a",
            "accountNumber": "123",
            "availableFunds": 12.34,
            "accountBalance": 34.56
        ]
        let account = Account(json: json)
        XCTAssertNil(account)
    }

    func testAccountListFromJson() {
        let rawAccount: JSON = [
            "accountName": "a",
            "accountNumber": "123",
            "availableFunds": 12.34,
            "accountBalance": 34.56
        ]
        let json: JSON = ["accounts": [rawAccount]]
        let accounts = Account.accountList(json: json)
        XCTAssertEqual(accounts.count, 1)
        if let account = accounts.first {
            XCTAssertEqual(account.accountName, "a")
            XCTAssertEqual(account.accountNumber, "123")
            XCTAssertEqual(account.availableFunds, 12.34)
            XCTAssertEqual(account.accountBalance, 34.56)
        }
    }

    func testGetAccounts() {
        let exp = expectation(description: "testGetAccounts")

        // FIXME: Use constructor DI to create a service which uses the StubServiceHelper
        //        let service = AccountService(serviceHelper: StubServiceHelper())

        // FIXME: call account service
        //        service.getAccounts { result in
        //
        //            // FIXME: put asserts here
        //            switch result {
        //            case .success:
        //            case .failure:
        //            }
        //
        //            exp.fulfill()   // this tells the test the async is complete
        //        }

        // if async call doesn't run, fail the test
        waitForExpectations(timeout: 5) { error in
            guard let error = error else { return }
            XCTFail(error.localizedDescription)
        }
    }
}
