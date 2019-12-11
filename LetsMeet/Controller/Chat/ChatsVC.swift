//
//  ChatsVC.swift
//  LetsMeet
//
//  Created by albert coelho oliveira on 12/9/19.
//  Copyright © 2019 albert coelho oliveira. All rights reserved.
//

import Foundation
import UIKit

class ChatsVC: UITableViewController {
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
          super.viewDidLoad()
        setUpView()
    }
    //MARK: - Variables
    var user: AppUser?
    //MARK: - UI Objects
    lazy var newMessageButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(systemName: "square.and.pencil"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(segueToMessageVC))
               return button
           }()
   


    //MARK: - Objc Functions
    @objc private func segueToMessageVC(){
    let newMessageVC = NewMessageVC()
    present(newMessageVC, animated: true, completion: nil )
    }
    //MARK: - Regular Functions
    private func setUpView(){
          view.backgroundColor = .white
        navigationItem.title = user?.email
        navigationItem.rightBarButtonItem = newMessageButton
      }
    //MARK: - Constraints



}
