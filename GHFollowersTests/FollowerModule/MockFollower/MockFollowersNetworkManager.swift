//
//  MockNetworkManager.swift
//  GHFollowersTests
//
//  Created by Subhankar  Acharya on 25/07/22.
//

import Foundation
import PromiseKit
@testable import GHFollowers

class MockFollowersNetworkManager: NetworkManagerProtocol {

    var follower: [Follower]?
    var error: Error?

    func request<T: Codable>(_ type: T.Type, endPoint: URL) -> Response<T> {
        return Promise { seal in
            if let error = error {
                seal.reject(error)
            } else {
                if let follower = follower {
                    seal.fulfill(follower as! T)
                } else {
                    seal.reject(NSError(domain: "com.example.error", code: 1, userInfo: [NSLocalizedDescriptionKey: "No Data available"]))
                }
            }
        }
    }
}
