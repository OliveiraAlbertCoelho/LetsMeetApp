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
        constrainfeedTableVC()
         loadPosts()
        feedTableVC.estimatedRowHeight = 100
        feedTableVC.rowHeight = UITableView.automaticDimension
     
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        loadPosts()
    }
    var currentUser: AppUser?
    var posts = [Post](){
        didSet{
            feedTableVC.reloadData()
        }
    }
    //MARK: - Variables
    //MARK: - UI Objects
    lazy var addPostButton: UIBarButtonItem = {
        let button = UIBarButtonItem(title: "Add Post", style: UIBarButtonItem.Style.plain, target: self, action: #selector(segueCreatePost))
        return button
    }()
    lazy var feedTableVC: UITableView = {
        let layout = UITableView()
        layout.separatorColor = .clear
        layout.register(PostTableViewCell.self, forCellReuseIdentifier: "postsCell")
        layout.backgroundColor = .clear
        layout.delegate = self
        layout.dataSource = self
        return layout
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
    private func loadPosts(){
        FirestoreService.manager.getAllPost { (result) in
            switch result{
            case .failure(let error):
                print(error)
            case .success(let post):
                self.posts = post
            }
        }
    }
    //MARK: - Constraints
    private func constrainfeedTableVC(){
        view.addSubview(feedTableVC)
        feedTableVC.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            feedTableVC.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            feedTableVC.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            feedTableVC.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            feedTableVC.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
        ])
    }
}
//MARK: - UITableViewDelegates
extension FeedVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = feedTableVC.dequeueReusableCell(withIdentifier: "postsCell", for: indexPath) as? PostTableViewCell else{ return UITableViewCell()}
        let data = posts[indexPath.row]
        cell.userNameLabel.text = currentUser?.userName ?? ""
        cell.postContentLabel.text = data.postContent ?? ""
        FirebaseStorage.profilemanager.getImages(profileUrl: (currentUser?.photoURL)!) { (result) in
            switch result{
            case .failure(let error):
                print(error)
            case .success(let data):
                cell.userProfileImage.image = UIImage(data: data)
            }
        }
        cell.postContentLabel.sizeToFit()
        cell.postContentLabel.layoutIfNeeded()
        return cell
    }
    
}
