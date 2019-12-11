//
//  UserProfileVc.swift
//  LetsMeet
//
//  Created by albert coelho oliveira on 11/26/19.
//  Copyright © 2019 albert coelho oliveira. All rights reserved.
//

import UIKit

class UserProfileVC: UIViewController {
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        setUpContraints()
        setUpUserNameStack()
    }
    //MARK: - Regular Functions
    private func setUpView(){
        view.backgroundColor = .white
        navigationItem.leftBarButtonItem = logOutButton
    }
    private func setUpContraints(){
        constrainContainerView()
        constrainProfileImage()
    }
    //MARK: - UI Objects
    lazy var profileImage: UIImageView = {
       let image = UIImageView()
        image.backgroundColor = .blue
        image.layer.cornerRadius = 100
        image.layer.masksToBounds = true
        return image
    }()
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    lazy var userNameLabel: UILabel = {
       let label = UILabel()
        return label
    }()
    lazy var currentUsernameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    lazy var currentEmailLabel: UILabel = {
       let label = UILabel()
        return label
    }()
    lazy var logOutButton: UIBarButtonItem = {
        let button = UIBarButtonItem(title: "Log Out", style: UIBarButtonItem.Style.plain, target: self, action: #selector(logOut))
        return button
    }()
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 5
        stack.distribution = .fillEqually
        return stack
    }()
    //MARK: - Constraints
    private func constrainContainerView(){
        view.addSubview(containerView)
               containerView.translatesAutoresizingMaskIntoConstraints = false
               NSLayoutConstraint.activate([
                containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                containerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.30)
               ])
    }
    private func constrainProfileImage(){
        containerView.addSubview(profileImage)
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileImage.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            profileImage.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0),
            profileImage.heightAnchor.constraint(equalToConstant: 200),
            profileImage.widthAnchor.constraint(equalToConstant: 200),
        ])
    }
   
    private func setUpUserNameStack(){
        stackView.addArrangedSubview(userNameLabel)
        stackView.addArrangedSubview(currentUsernameLabel)
        stackView.addArrangedSubview(emailLabel)
        stackView.addArrangedSubview(currentEmailLabel)
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
              NSLayoutConstraint.activate([
                  stackView.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 20),
                  stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                  stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                  stackView.heightAnchor.constraint(equalToConstant: 200),
            ])
    }
  
    
    
    
    //MARK: - Objc functions
   @objc private func logOut (){
          DispatchQueue.main.async {
              FirebaseAuthService.manager.logOut { (result) in
              }
              guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                  let sceneDelegate = windowScene.delegate as? SceneDelegate, let window = sceneDelegate.window
                  else {
                      return
              }
              UIView.transition(with: window, duration: 0.3, options: .transitionFlipFromBottom, animations: {
                  window.rootViewController = LoginVC()
              }, completion: nil)
          }
    }
}
