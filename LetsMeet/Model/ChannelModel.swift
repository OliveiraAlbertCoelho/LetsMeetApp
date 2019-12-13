//
//  ChannelModel.swift
//  LetsMeet
//
//  Created by albert coelho oliveira on 12/13/19.
//  Copyright © 2019 albert coelho oliveira. All rights reserved.
//

import Foundation

struct ChannelModel{
    let id: String
    let contacts: [String]
    
    init( contacts: [String]){
        self.contacts = contacts
        self.id = UUID().description
            
        }
        init? (from dict: [String: Any], id: String){
            guard let contacts = dict["contacts"] as? [String] else { return nil }
            self.id = id
            self.contacts = contacts
        }
        var fieldsDict: [String: Any] {
               return [
                   "contacts": self.contacts,
               ]
           }
        
    }
