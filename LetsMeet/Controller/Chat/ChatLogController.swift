//
//  ChatLogController.swift
//  LetsMeet
//
//  Created by albert coelho oliveira on 12/10/19.
//  Copyright © 2019 albert coelho oliveira. All rights reserved.
//

import UIKit
import Foundation
class ChatLogController: UIViewController {
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        view.backgroundColor = .white
    }
    //MARK: - Variables
      //MARK: - UI Objects
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    lazy var chatTableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .blue
        return table
    }()
    lazy var userInput: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .gray
        return textView
    }()
    lazy var sendButton: UIButton = {
       let button = UIButton()
        button.setTitle("Send", for: .normal)
        button.tintColor = .red
        return button
    }()
    //MARK: - Objc Functions
      //MARK: - Regular Functions
    private func setUpView(){
        constrainContainerView()
        constrainSendButton()
        constrainUserInput()
        constrainTableView()
    }
      //MARK: - Constraints
    private func constrainContainerView(){
        view.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            containerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            containerView.heightAnchor.constraint(equalTo:  view.heightAnchor, multiplier: 0.08)
        ])
    }
    private func constrainSendButton(){
           containerView.addSubview(sendButton)
               sendButton.translatesAutoresizingMaskIntoConstraints = false
               NSLayoutConstraint.activate([
                   sendButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0),
                   sendButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0),
                   sendButton.widthAnchor.constraint(equalToConstant: 80),
                   sendButton.heightAnchor.constraint(equalTo:  containerView.heightAnchor)
               ])
           }
    private func constrainUserInput(){
        containerView.addSubview(userInput)
            userInput.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                userInput.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0),
                userInput.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0),
                userInput.trailingAnchor.constraint(equalTo: sendButton.leadingAnchor, constant: 0),
                userInput.heightAnchor.constraint(equalTo:  containerView.heightAnchor, multiplier: 0)
            ])
        }
    
  private func constrainTableView(){
        view.addSubview(chatTableView)
              chatTableView.translatesAutoresizingMaskIntoConstraints = false
              NSLayoutConstraint.activate([
                  chatTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
                  chatTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
                  chatTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
                  chatTableView.bottomAnchor.constraint(equalTo: containerView.topAnchor)
              ])
          }
}
