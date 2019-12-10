//
//  ChatsVC.swift
//  LetsMeet
//
//  Created by albert coelho oliveira on 12/9/19.
//  Copyright © 2019 albert coelho oliveira. All rights reserved.
//

import Foundation
import UIKit

class ChatsVC: UITableViewController {
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
          super.viewDidLoad()
        setUpView()
    }
    //MARK: - Variables
    var user: AppUser?
    //MARK: - UI Objects
    lazy var logOutButton: UIBarButtonItem = {
            let button = UIBarButtonItem(title: "Log Out", style: UIBarButtonItem.Style.plain, target: self, action: #selector(logOut))
            return button
        }()
    lazy var newMessageButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(systemName: "square.and.pencil"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(segueToMessageVC))
               return button
           }()
   


    //MARK: - Objc Functions
    @objc private func segueToMessageVC(){
    let newMessageVC = NewMessageVC()
    present(newMessageVC, animated: true, completion: nil )
    }
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
    //MARK: - Regular Functions
    private func setUpView(){
          navigationItem.leftBarButtonItem = logOutButton
          view.backgroundColor = .white
        navigationItem.title = user?.email
        navigationItem.rightBarButtonItem = newMessageButton
      }
    //MARK: - Constraints



}
