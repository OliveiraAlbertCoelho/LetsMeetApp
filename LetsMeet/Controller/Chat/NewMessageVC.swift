//
//  NewMessageController.swift
//  LetsMeet
//
//  Created by albert coelho oliveira on 12/9/19.
//  Copyright © 2019 albert coelho oliveira. All rights reserved.
//

import Foundation
import UIKit

class NewMessageVC: UITableViewController {
    let cellId = "cellId"
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Message"
        getUsers()
    }
    //MARK: - Variables
    var users = [AppUser](){
        didSet{
            tableView.reloadData()
        }
    }
    //MARK: - UI Objects

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
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cellId")
        let data = users[indexPath.row]
        cell.textLabel?.text = data.email
        return cell
        
    }
}
