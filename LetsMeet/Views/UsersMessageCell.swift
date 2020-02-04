//
//  UsersMessageCell.swift
//  LetsMeet
//
//  Created by albert coelho oliveira on 12/10/19.
//  Copyright © 2019 albert coelho oliveira. All rights reserved.
//

import Foundation
import UIKit

class UsersMessageCell: UITableViewCell {

    //MARK: - Lifecycle
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
             super.init(style: style, reuseIdentifier: reuseIdentifier)
            setUpContentView()
         }
        required init(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    override func prepareForReuse() {
        super.prepareForReuse()
        userProfileImage.image = nil
    }
     //MARK: - UI Objects
        lazy var userProfileImage: UIImageView = {
           let image = UIImageView()
            image.layer.cornerRadius = 40
            image.layer.masksToBounds = true
            return image
        }()
        lazy var userNameLabel: UILabel = {
           let label = UILabel()
            label.numberOfLines = 0
            return label
        }()
        
      //MARK: - Regular Functions
        private func setUpContentView(){
            constrainImage()
            constrainUserName()
        }
         //MARK: - objc Functions
      
        
        
     //MARK: - Constraints
        private func constrainImage(){
             contentView.addSubview(userProfileImage)
             userProfileImage.translatesAutoresizingMaskIntoConstraints = false
             NSLayoutConstraint.activate([
                 userProfileImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
                 userProfileImage.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 8 ),
                 userProfileImage.widthAnchor.constraint(equalToConstant: 80),
                 userProfileImage.heightAnchor.constraint(equalToConstant: 80)
             ])
         }
            private func constrainUserName(){
                contentView.addSubview(userNameLabel)
                userNameLabel.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    userNameLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 10),
                    userNameLabel.leadingAnchor.constraint(equalTo: userProfileImage.trailingAnchor, constant: 10),
                    userNameLabel.heightAnchor.constraint(equalToConstant: 20)
                ])
            }
        }

