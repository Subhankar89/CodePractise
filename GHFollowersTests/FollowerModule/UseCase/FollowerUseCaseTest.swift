//
//  FollowerUseCaseTest.swift
//  GHFollowersTests
//
//  Created by Subhankar  Acharya on 25/07/22.
//

import XCTest
@testable import GHFollowers

class FollowerUseCaseTest: XCTestCase {

    var useCase: FollowerUseCase?
    let repository = MockFollowersRepository()

    override func setUpWithError() throws {
        useCase = FollowerUseCase(repository: repository)
    }
    
    override func tearDownWithError() throws {
        useCase = nil
    }

    func testUseCase_Success() {
        let expecatation = expectation(description: "Success")

        repository.follower = MockFollowersData.follower
        guard let useCase = useCase else { return }
        useCase.getFollowers()
            .done { model in
                let followerCount = model.count
                if followerCount >= 1 {
                    expecatation.fulfill()
                }
            }
            .catch { _ in }

        wait(for: [expecatation], timeout: 1.0)
    }

    func testUseCase_Failure() {
        let expecatation = expectation(description: "Failure")
        repository.error = NSError(domain: "com.example.error", code: 0, userInfo: [NSLocalizedDescriptionKey: ErrorMessage.kUseCaseFailedErrorMessage])
        guard let useCase = useCase else { return }
        useCase.getFollowers()
            .catch { error in
                XCTAssertTrue(error.localizedDescription == ErrorMessage.kUseCaseFailedErrorMessage)
                expecatation.fulfill()
            }

        wait(for: [expecatation], timeout: 1.0)
    }
}
