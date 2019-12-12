//
//  FeedVC.swift
//  LetsMeet
//
//  Created by albert coelho oliveira on 12/11/19.
//  Copyright © 2019 albert coelho oliveira. All rights reserved.
//

import UIKit

class FeedVC: UIViewController {
      //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    var currentUser: AppUser?
    //MARK: - Variables
    //MARK: - UI Objects
    lazy var addPostButton: UIBarButtonItem = {
        let button = UIBarButtonItem(title: "Add Post", style: UIBarButtonItem.Style.plain, target: self, action: #selector(segueCreatePost))
        return button
    }()
    
    //MARK: - Objc Functions
    @objc private func segueCreatePost(){
        let createVC = CreatePostVC()
        createVC.currentUser = currentUser
        navigationController?.pushViewController(createVC, animated: true)
    }
    //MARK: - Regular Functions
    private func setUpView(){
        view.backgroundColor = .white
        navigationItem.title  = "Explore"
        navigationItem.rightBarButtonItem = addPostButton
    }
    //MARK: - Constraints
}
