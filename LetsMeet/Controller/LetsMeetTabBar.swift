//
//  LetsMeetTabBar.swift
//  LetsMeet
//
//  Created by albert coelho oliveira on 11/26/19.
//  Copyright © 2019 albert coelho oliveira. All rights reserved.
//

import UIKit

class LetsMeetTabBar: UITabBarController {
    
   let profile = UserProfileVc()
    override func viewDidLoad() {
        super.viewDidLoad()
        profile.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "house"), tag: 0)
        self.viewControllers = [profile]
    }
}
