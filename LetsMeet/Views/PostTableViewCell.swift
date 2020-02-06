//
//  PostTableViewCell.swift
//  LetsMeet
//
//  Created by albert coelho oliveira on 2/4/20.
//  Copyright © 2020 albert coelho oliveira. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

   //MARK: - Lifecycle
       override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           super.init(style: style, reuseIdentifier: reuseIdentifier)
            constrainView()
       }
       required init(coder aDecoder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
    lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    lazy var postContentLabel: UILabel = {
        let textview = UILabel()
        textview.numberOfLines = 0
        textview.font = UIFont(name: "Menlo", size: 20)!
        return textview
    }()
    lazy var userProfileImage: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 35
        view.layer.masksToBounds = true
        return view
    }()
    lazy 
    
    private func constrainView(){
        userProfileImageConstraint()
        constrainUserName()
        constrainPostContentLabel()
  
    }

    private func userProfileImageConstraint(){
        contentView.addSubview(userProfileImage)
        userProfileImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userProfileImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            userProfileImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            userProfileImage.heightAnchor.constraint(equalToConstant: 70),
            userProfileImage.widthAnchor.constraint(equalToConstant: 70)
        ])
    }
    private func constrainUserName(){
        contentView.addSubview(userNameLabel)
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userNameLabel.leadingAnchor.constraint(equalTo: userProfileImage.trailingAnchor, constant: 10),
            userNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            userNameLabel.heightAnchor.constraint(equalToConstant: 20),
            userNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10)
        
        ])
    }
    private func constrainPostContentLabel(){
        contentView.addSubview(postContentLabel)
        postContentLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            postContentLabel.topAnchor.constraint(equalTo: userProfileImage.bottomAnchor, constant: 10),
            postContentLabel.leadingAnchor.constraint(equalTo: userProfileImage.trailingAnchor, constant: 10),
            postContentLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            postContentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
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
