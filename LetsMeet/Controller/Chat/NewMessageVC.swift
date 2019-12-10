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
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Message"
    }

    //MARK: - Variables
    //MARK: - UI Objects

    //MARK: - Objc Functions
    //MARK: - Regular Functions
    //MARK: - Constraints
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
}
