//
//  ChatLogController.swift
//  LetsMeet
//
//  Created by albert coelho oliveira on 12/10/19.
//  Copyright © 2019 albert coelho oliveira. All rights reserved.
//

import UIKit

class ChatLogController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    lazy var containerView: UIView = {
        let view = UIView()
        return view
    }()
    lazy var chatTableView: UITableView = {
        let table = UITableView()
        return table
    }()
    lazy var userInput: UITextView = {
        let textView = UITextView()
        return textView
    }()
    lazy var sendButton: UIButton = {
       let button = UIButton()
        return button
    }()
}
