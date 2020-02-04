//
//  PostTableViewCell.swift
//  LetsMeet
//
//  Created by albert coelho oliveira on 2/4/20.
//  Copyright © 2020 albert coelho oliveira. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    lazy var userNameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    lazy var postContentLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    lazy var userProfileImage: UIImageView = {
        let view = UIImageView()
        return view
    }()
    private func userProfileImageConstraint(){
        contentView.addSubview(userProfileImage)
        userProfileImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userProfileImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            userProfileImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            userProfileImage.heightAnchor.constraint(equalToConstant: 50),
            userProfileImage.widthAnchor.constraint(equalToConstant: 50)
        ])
    }

//    private func userNamelabelConstraints(){
//        contentView.addSubview(userNameLabel)
//        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            userNameLabel.
//
//
//        ])
//    }
    
}
