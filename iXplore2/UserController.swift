//
//  UserController.swift
//  iXplore2
//
//  Created by Lauren Caverly on 6/14/16.
//  Copyright © 2016 Lauren Caverly. All rights reserved.
//

import Foundation

class User: NSObject, NSCoding {
    
    var username:String?
    var password:String?
    
    required init(username:String?, password:String?) {
        self.username = username
        self.password = password
        
    }
    
    // MARK: - NSCoding
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.username, forKey: "username")
        aCoder.encodeObject(self.password, forKey: "password")
        
        
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        
        let username = aDecoder.decodeObjectForKey("username") as? String
        let password = aDecoder.decodeObjectForKey("password") as? String
        
        self.init(username:username, password:password)
        
    }
}