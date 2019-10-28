//
//  DataService.swift
//  fishlist
//
//  Created by Andre Burgoyne on 2019-10-23.
//  Copyright © 2019 Andre Burgoyne. All rights reserved.
//

import Foundation
import Firebase

let DB_BASE = Database.database().reference()

class DataService {
    static let instance = DataService()
    
    private var _REF_BASE = DB_BASE
    private var _REF_USERS = DB_BASE.child("users")
    private var _REF_CATCHES = DB_BASE.child("catches")
    
    var REF_BASE: DatabaseReference {
        return _REF_BASE
    }
    
    var REF_USERS: DatabaseReference {
        return _REF_USERS
    }
    
    var REF_CATCHES: DatabaseReference {
        return _REF_CATCHES
    }
    
    func createDbUser(uid: String, userData: Dictionary<String, Any>) {
        REF_USERS.child(uid).updateChildValues(userData)
    }
}
