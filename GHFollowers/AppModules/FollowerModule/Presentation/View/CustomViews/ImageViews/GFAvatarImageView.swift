//
//  GFAvatarImageView.swift
//  GHFollowers
//
//  Created by Subhankar  Acharya on 25/07/22.
//

import UIKit

class GFAvatarImageView: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure() {
        layer.cornerRadius = 10
        clipsToBounds = true
        image = Constants.Image.placeholderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
}
