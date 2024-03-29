//
//  MockRepository.swift
//  GHFollowersTests
//
//  Created by Subhankar  Acharya on 25/07/22.
//

import Foundation
import PromiseKit
@testable import GHFollowers

class MockFollowersRepository: FollowerRepositoryProtocol {

    var follower: [Follower]?
    var error: Error?

    func makeServiceCallToGetFollowers() -> FollowerResponse {
        return Promise { seal in
            if let error = error {
                seal.reject(error)
            } else {
                if let follower = follower {
                    seal.fulfill(follower)
                } else {
                    seal.reject(NSError(domain: "com.example.error", code: 1, userInfo: [NSLocalizedDescriptionKey: "No Data available"]))
                }
            }
        }
    }
}
