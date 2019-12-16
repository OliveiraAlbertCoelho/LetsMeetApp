//
//  MessageModel.swift
//  LetsMeet
//
//  Created by albert coelho oliveira on 12/13/19.
//  Copyright © 2019 albert coelho oliveira. All rights reserved.
//

import Foundation
import Firebase
struct MessageModel{
        let id: String
        let profilePhoto: String
        let sender_id: String?
        let sender_name: String?
        let message: String
        let date: Date?
    
    init(profilePhoto: String, sender_id: String , sender_name: String, message: String, date: Date? = nil){
        self.profilePhoto = profilePhoto
            self.sender_id = sender_id
            self.sender_name = sender_name
            self.id = UUID().description
            self.date = date
        self.message = message
        
    }
        init? (from dict: [String: Any], id: String){
            guard let profilePhoto = dict["profilePhoto"] as? String,
            let sender_id = dict["sender_id"] as? String,
            let sender_name = dict["sender_name"] as? String,
            let message = dict["message"] as? String,
            let date = (dict["dateCreated"] as? Timestamp)?.dateValue() else { return nil }
            self.sender_id = sender_id
            self.id = id
            self.date = date
            self.profilePhoto = profilePhoto
            self.sender_name = sender_name
            self.message = message
        }
        var fieldsDict: [String: Any] {
               return [
                   "sender_id": self.sender_id ?? "",
                   "date": self.date ?? "",
                   "profilePhoto": self.profilePhoto,
                   "sender_name": self.sender_name ?? "",
                   "message": self.message,
               ]
           }
        
    }
