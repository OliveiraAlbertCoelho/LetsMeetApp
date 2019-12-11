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
    var user = AppUser(from: FirebaseAuthService.manager.currentUser!)
    //MARK: - Variables
      //MARK: - UI Objects
    lazy var containerView: UIView = {
        let view = UIView()
        return view
    }()
    lazy var chatTableView: UITableView = {
        let table = UITableView()
        return table
    }()
    lazy var userInput: UITextField = {
        let textView = UITextField()
        textView.placeholder = "Enter message..."

        return textView
    }()
    lazy var sendButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.setTitle("Send", for: .normal)
        return button
    }()
    lazy var separatorLineView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8626694083, green: 0.8627938032, blue: 0.8626419902, alpha: 1)
        return view
    }()
    //MARK: - Objc Functions
 
      //MARK: - Regular Functions
    private func setUpView(){
        constrainContainerView()
        constrainSeparatorLine()
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
                userInput.topAnchor.constraint(equalTo: separatorLineView.bottomAnchor)
            ])
        }
    private func constrainSeparatorLine(){
        containerView.addSubview(separatorLineView)
                  separatorLineView.translatesAutoresizingMaskIntoConstraints = false
                  NSLayoutConstraint.activate([
                      separatorLineView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0),
                      separatorLineView.widthAnchor.constraint(equalTo: containerView.widthAnchor, constant: 0),
                      separatorLineView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0),
                      separatorLineView.heightAnchor.constraint(equalToConstant: 1)
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
