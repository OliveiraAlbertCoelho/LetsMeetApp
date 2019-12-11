//
//  LetsMeetTabBar.swift
//  LetsMeet
//
//  Created by albert coelho oliveira on 11/26/19.
//  Copyright © 2019 albert coelho oliveira. All rights reserved.
//

import UIKit

class LetsMeetTabBar: UITabBarController {
    
   
    lazy var profileViewController: UINavigationController = {
           let profileVC = UserProfileVC()
            profileVC.currentUser = AppUser(from: FirebaseAuthService.manager.currentUser!)
           return UINavigationController(rootViewController: profileVC)
       }()
    lazy var chatsViewController: UINavigationController = {
        let chatVC = ChatsVC()
        return UINavigationController(rootViewController: chatVC)
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        profileViewController.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "house"), tag: 0)
        chatsViewController.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "message"), tag: 1)
        self.viewControllers = [profileViewController, chatsViewController]
    }
}
