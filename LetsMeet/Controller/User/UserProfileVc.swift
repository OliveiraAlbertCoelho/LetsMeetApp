//
//  UserProfileVc.swift
//  LetsMeet
//
//  Created by albert coelho oliveira on 11/26/19.
//  Copyright © 2019 albert coelho oliveira. All rights reserved.
//

import UIKit

class UserProfileVc: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    //MARK: - Regular Functions
    //MARK: - UI Objects
    lazy var logOutButton: UIBarButtonItem = {
        let button = UIBarButtonItem(title: "Log Out", style: UIBarButtonItem.Style.plain, target: self, action: #selector(logOut))
        return button
    }()
    @objc private func logOut(){
        
    }
    
}
