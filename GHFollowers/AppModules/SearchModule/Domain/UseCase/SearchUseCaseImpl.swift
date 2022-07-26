//
//  SearchUseCaseImpl.swift
//  GHFollowers
//
//  Created by Subhankar  Acharya on 26/07/22.
//

import Foundation
/// Business logic to validate if username is empty and pass back to view model.
class SearchUseCaseImpl: ISearchUseCase {

    func validateUser(for userName: String, completion: (Bool) -> ()) {
        if userName.isEmpty {
            completion(false)
        } else {
            completion(true)
        }
    }
}