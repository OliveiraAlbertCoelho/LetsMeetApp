//
//  UserProfileVc.swift
//  LetsMeet
//
//  Created by albert coelho oliveira on 11/26/19.
//  Copyright © 2019 albert coelho oliveira. All rights reserved.
//

import UIKit

class UserProfileVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    //MARK: - Regular Functions
    private func setUpView(){
        view.backgroundColor = .white
        navigationItem.leftBarButtonItem = logOutButton
    }
    //MARK: - UI Objects
    lazy var logOutButton: UIBarButtonItem = {
        let button = UIBarButtonItem(title: "Log Out", style: UIBarButtonItem.Style.plain, target: self, action: #selector(logOut))
        return button
    }()
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
    }}
