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
           let profileVC = UserProfileVc()
           return UINavigationController(rootViewController: profileVC)
       }()
    override func viewDidLoad() {
        super.viewDidLoad()
        profileViewController.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "house"), tag: 0)
        self.viewControllers = [profileViewController]
    }
}
