//
//  PostModel.swift
//  LetsMeet
//
//  Created by albert coelho oliveira on 12/11/19.
//  Copyright © 2019 albert coelho oliveira. All rights reserved.
//

import Foundation
import FirebaseFirestore
struct Post {
    let id: String
    let creatorID: String
    let postContent: String?
    let dateCreated: Date?
    let imageUrl: String?
    var dateFormat: String {
        guard let date = dateCreated else{
            return "no date"
        }
      let dateFormatter = DateFormatter()
          dateFormatter.dateFormat = "dd MMM, yyyy hh:mm:ss"
        return dateFormatter.string(from: date)

    }
    
    init( creatorID: String, imageUrl: String? = nil, postContent: String? = nil){
        self.creatorID = creatorID
        self.dateCreated = nil
        self.imageUrl = imageUrl
        self.id = UUID().description
        self.postContent = postContent
    }
    init? (from dict: [String: Any], id: String){
        guard let userId = dict["creatorID"] as? String,
         let userImage = dict["imageUrl"] as? String,
        let postContent = dict["postContent"] as? String,
         let dateCreated = (dict["dateCreated"] as? Timestamp)?.dateValue() else { return nil }
        self.creatorID = userId
        self.id = id
        self.dateCreated = dateCreated
        self.imageUrl = userImage
        self.postContent = postContent
    }
    var fieldsDict: [String: Any] {
           return [
               "creatorID": self.creatorID,
               "imageUrl": self.imageUrl ?? "",
               "postContent": self.postContent ?? ""
           ]
       }
    
}
