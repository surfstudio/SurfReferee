//
//  RefereeTests.swift
//  RefereeTests
//
//  Created by Ilya Cherkasov on 25.07.2022.
//

import XCTest
@testable import Referee

class TestVoter: Voting {
    
    var votersProvider: VotersProvider?
    var validator: Validator = Validator()
    
    var name = "Ilya"
    
}

class RefereeTests: XCTestCase {
    
    lazy var referee = Referee.make(with: votersBody.voters)
    
    lazy var nameMediumPriorityRule = DefaultSelfCheckRule(
        priority: .medium,
        tag: "testRule"
    ) { voter in
        let voter = voter as? TestVoter
        return voter?.name == "Vova"
    }
    
    lazy var nameHighPriorityRule = DefaultSelfCheckRule(
        priority: .high,
        tag: "testRule"
    ) { voter in
        let voter = voter as? TestVoter
        return voter?.name == "Ilya"
    }
    
    lazy var votersBody: Voters = {
        VotersRules([nameMediumPriorityRule, nameHighPriorityRule]) {
            TestVoter()
        }
    }()
    
    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
    }

    func testTryResolveWithoutConflicts() throws {
        let conflicts = referee.exposeTryResolve([])
        XCTAssert(conflicts.isEmpty)
    }
    
    func testNameRule() {
        let conflicts = referee.startVoting()
        XCTAssert(conflicts.isEmpty)
    }

}
