//
//  AppUser.swift
//  LetsMeet
//
//  Created by albert coelho oliveira on 11/26/19.
//  Copyright © 2019 albert coelho oliveira. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

struct AppUser {
    let email: String?
    let uid: String
    let dateCreated: Date?
    
    init(from user: User) {
        self.email = user.email
        self.uid = user.uid
        self.dateCreated = user.metadata.creationDate
    }
    
    init?(from dict: [String: Any], id: String) {
        guard let email = dict["email"] as? String,
             let dateCreated = (dict["dateCreated"] as? Timestamp)?.dateValue() else { return nil }
        
        self.email = email
        self.uid = id
        self.dateCreated = dateCreated
    }
    
    var fieldsDict: [String: Any] {
        return [
            "email": self.email ?? ""
        ]
    }
}
