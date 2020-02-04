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
   
    lazy var postButton: UIButton = {
        let button = UIButton()
        button.setTitle("Post", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        button.addTarget(self, action: #selector(postAction), for: .touchUpInside)
        return button
    }()
    
    
    //MARK: - Objc Functions
    @objc private func postAction(){
        var post = Post(creatorID: currentUser!.uid, imageUrl: nil, postContent: userPostInput.text)
        FirestoreService.manager.createPost(post: post) { (result) in
            switch result{
            case .failure(let error):
                print(error)
            case .success(()):
                print("hell yeah")
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    //MARK: - Regular Functions
    private func setUpView(){
        view.backgroundColor = .white
    }
    
    private func setUpConstraints(){
        constrainPostLabel()
        constrainUserInput()
        constrainPostButton()
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
    private func constrainPostButton(){
        view.addSubview(postButton)
        postButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            postButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            postButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            postButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            postButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
