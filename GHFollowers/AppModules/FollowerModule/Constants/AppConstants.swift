//
//  AppConstants.swift
//  GHFollowers
//
//  Created by Subhankar  Acharya on 21/07/22.
//

import UIKit

struct Constants {

    struct UserAPIEndpoint {
        static let baseURL = "https://api.github.com/users/"
    }

    struct Title {
        static let searchViewController = "Search"
        static let followerViewController = "Followers"
    }

    struct Cell {
        static let followerCellID = "FollowerCell"
    }

    struct Image {
        static let placeholderImage = UIImage(named: "avatar-placeholder")
    }

    struct AccessiblityIdentifier {
        static let identifier = "FollowerListViewController"
    }
}
