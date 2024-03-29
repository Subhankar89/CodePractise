//
//  FollowerRepositoryTest.swift
//  GHFollowersTests
//
//  Created by Subhankar  Acharya on 25/07/22.
//

import XCTest
@testable import GHFollowers

class FollowerRepositoryTest: XCTestCase {

    var followerRepository: FollowerRepository?
    let mockService = MockFollowersService()

    override func setUpWithError() throws {
        followerRepository = FollowerRepository(service: mockService)
    }
    
    override func tearDownWithError() throws {
        followerRepository = nil
    }

    func testRepository_Success() {
        let expecatation = expectation(description: "Success")
        mockService.follower = MockFollowersData.follower
        guard let followerRepository = followerRepository else { return }
        followerRepository.makeServiceCallToGetFollowers()
            .done { model in
                let followerCount = model.count
                if followerCount >= 1 {
                    expecatation.fulfill()
                }
            }
            .catch { _ in
                expecatation.fulfill()
            }

        wait(for: [expecatation], timeout: 1.0)
    }

    func testRepository_Failure() {
        let expecatation = expectation(description: "Failure")
        mockService.error = NSError(domain: "com.example.error", code: 0, userInfo: [NSLocalizedDescriptionKey: ErrorMessage.kRepositoryFailedErrorMessage])
        guard let followerRepository = followerRepository else { return }
        followerRepository.makeServiceCallToGetFollowers()
            .catch {error in
                XCTAssertTrue(error.localizedDescription == ErrorMessage.kRepositoryFailedErrorMessage)
                expecatation.fulfill()
            }

        wait(for: [expecatation], timeout: 1.0)
    }
}
