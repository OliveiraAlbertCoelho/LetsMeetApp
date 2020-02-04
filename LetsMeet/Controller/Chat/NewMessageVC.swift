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
        setUpTableViewConstraints()
        getUsers()
    }
    
    var currentUser = FirebaseAuthService.manager.currentUser!
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
                print(user.count)
            }
        }
    }
    
    //MARK: - Constraints
    private func setUpTableViewConstraints(){
        view.addSubview(usersTable)
        usersTable.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            usersTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            usersTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            usersTable.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor),
            usersTable.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
extension NewMessageVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = usersTable.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as? UsersMessageCell else {return UITableViewCell()}
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
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let chatLogVC = ChatLogController()
        let selectedUser = users[indexPath.row]
        let channel = ChannelModel(contacts: [selectedUser.uid, currentUser.uid])
        FirestoreService.manager.checkChannel(users: [currentUser.uid, selectedUser.uid]){ (result) in
            switch result{
            case .failure(let error):
                print(error)
            case .success(()):
               print("yeah")
            }
        }
        self.navigationController?.pushViewController(chatLogVC, animated: true)
    }
}
