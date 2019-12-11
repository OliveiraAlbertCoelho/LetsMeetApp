//
//  NewMessageController.swift
//  LetsMeet
//
//  Created by albert coelho oliveira on 12/9/19.
//  Copyright © 2019 albert coelho oliveira. All rights reserved.
//

import Foundation
import UIKit

class NewMessageVC: UIViewController {
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Message"
        getUsers()
        setUpTableView()
    }
    private func setUpTableView(){

    }

    //MARK: - Variables
    var users = [AppUser](){
        didSet{
            usersTable.reloadData()
        }
    }
    //MARK: - UI Objects
    lazy var usersTable: UITableView = {
        let layout = UITableView()
        layout.register(UsersMessageCell.self, forCellReuseIdentifier: "userCell")
        layout.backgroundColor = .white
        layout.delegate = self
        layout.dataSource = self
        return layout
    }()
    //MARK: - Objc Functions
    //MARK: - Regular Functions
    private func getUsers(){
        FirestoreService.manager.getAllUsers{ (result) in
            switch result{
            case .failure(let error):
                print(error)
            case .success(let user):
                self.users = user
                print(user)
            }
        }
    }

    //MARK: - Constraints
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "userCell") as? UsersMessageCell else {return UITableViewCell()}
        let data = users[indexPath.row]
        cell.userNameLabel.text = data.email
        if let userImage = data.photoURL{
        FirebaseStorage.profilemanager.getImages(profileUrl: userImage) { (result) in
                 switch result{
                 case .failure(let error):
                     print(error)
                 case .success(let image):
                     cell.userProfileImage.image = UIImage(data: image)
                 }
             }
        }else{
             cell.userProfileImage.image = UIImage(named: "noImage")
        }
        return cell
    }
}
