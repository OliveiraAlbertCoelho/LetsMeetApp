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
            contentView.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
//        contentView.layer.cornerRadius = 30
//        contentView.clipsToBounds = true
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 10))
    }
    required init(coder aDecoder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
    //MARK: - Variables
    //MARK: - UI Objects
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
    lazy var commentButton: UIButton = {
        let button = UIButton()
        button.setTitle("Comment", for: .normal)
         button.titleLabel?.font = .systemFont(ofSize: 12)
        button.backgroundColor  = #colorLiteral(red: 0.3176470697, green: 0.07450980693, blue: 0.02745098062, alpha: 1)
        return button
    }()
    lazy var meetButton: UIButton = {
        let button = UIButton()
        button.setTitle("Meet", for: .normal)
         button.titleLabel?.font = .systemFont(ofSize: 12)
        button.backgroundColor  = #colorLiteral(red: 0.3176470697, green: 0.07450980693, blue: 0.02745098062, alpha: 1)
        return button
    }()
    lazy var messageButton: UIButton = {
        let button = UIButton()
        button.setTitle("Chat", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12)
        button.backgroundColor  = #colorLiteral(red: 0.3176470697, green: 0.07450980693, blue: 0.02745098062, alpha: 1)
        return button
    }()
    lazy var buttonStackView: UIStackView = {
              let stack = UIStackView(arrangedSubviews: [meetButton,commentButton ,messageButton])
              stack.axis = .horizontal
              stack.spacing = 1
              stack.distribution = .fillEqually
              return stack
          }()
    
    
    //MARK: - Objc Functions
    //MARK: - Regular Functions
    private func constrainView(){
        userProfileImageConstraint()
        constrainUserName()
        constrainPostContentLabel()
        constrainCommentButton()
  
    }
    //MARK: - Constraints
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
            postContentLabel.topAnchor.constraint(equalTo: userProfileImage.bottomAnchor, constant: 15),
            postContentLabel.leadingAnchor.constraint(equalTo: userProfileImage.leadingAnchor, constant: 15),
            postContentLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30),
            postContentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        ])
    }
    private func constrainCommentButton(){
        contentView.addSubview(buttonStackView)
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            buttonStackView.heightAnchor.constraint(equalToConstant: 18),
            buttonStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            buttonStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0)
        ])
    }


}
