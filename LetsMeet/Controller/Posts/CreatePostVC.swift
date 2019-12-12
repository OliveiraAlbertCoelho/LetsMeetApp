//
//  CreatePostVC.swift
//  LetsMeet
//
//  Created by albert coelho oliveira on 12/11/19.
//  Copyright © 2019 albert coelho oliveira. All rights reserved.
//

import UIKit

class CreatePostVC: UIViewController {
    //MARK: - Lifecycle
    override func viewDidLoad() {
           super.viewDidLoad()
            setUpView()
        setUpConstraints()
    }
    var currentUser: AppUser?
    //MARK: - Variables
    //MARK: - UI Objects
    lazy var postLabel: UILabel = {
     let label = UILabel()
        label.text = "Set up and event"
        label.font = .systemFont(ofSize: 25)
        return label
    }()
    lazy var userPostInput: UITextView = {
        let text = UITextView()
        text.font = .systemFont(ofSize: 20)
        return text
    }()
    lazy var postButton: UIBarButtonItem = {
        let button = UIBarButtonItem(title: "Post", style: UIBarButtonItem.Style.plain, target: self, action: #selector(postAction))
        return button
    }()
    
    //MARK: - Objc Functions
    @objc private func postAction(){
    }
    //MARK: - Regular Functions
    private func setUpView(){
        navigationItem.rightBarButtonItem = postButton
        view.backgroundColor = .white
    }
    
    private func setUpConstraints(){
        constrainPostLabel()
        constrainUserInput()
    }
    //MARK: - Constraints
    private func constrainPostLabel(){
        view.addSubview(postLabel)
        postLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            postLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            postLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            postLabel.widthAnchor.constraint(equalToConstant: 40),
            postLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    private func constrainUserInput(){
        view.addSubview(userPostInput)
        userPostInput.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userPostInput.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            userPostInput.topAnchor.constraint(equalTo: postLabel.bottomAnchor, constant: 10),
            userPostInput.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            userPostInput.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}
