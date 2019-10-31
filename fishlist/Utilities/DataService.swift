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
    
    func getUsername(forUID uid: String, handler: @escaping (_ username: String) -> ()) {
        REF_USERS.observeSingleEvent(of: .value) { (userSnapshot) in
            guard let userSnapshot = userSnapshot.children.allObjects as? [DataSnapshot] else { return }
            for user in userSnapshot {
                if user.key == uid {
                    handler(user.childSnapshot(forPath: "email").value as! String)
                }
            }
        }
    }
    
    func createFish(withSpecies species: String, andWeight weight: String, handler: @escaping (_ fishCreated: Bool) -> ()) {
        REF_CATCHES.childByAutoId().updateChildValues(["species": species, "weight": weight])
        handler(true)
    }
    
    func getAllFish(handler: @escaping (_ catchArray: [Fish]) -> ()) {
        var fishArray = [Fish]()
        REF_CATCHES.observeSingleEvent(of: .value) { (fishSnapshot) in
            guard let fishSnapshot = fishSnapshot.children.allObjects as? [DataSnapshot] else { return }
            for fish in fishSnapshot {
                    let species = fish.childSnapshot(forPath: "species").value as! String
                    let weight = fish.childSnapshot(forPath: "weight").value as! String
                    let cAtch = Fish(species: species, weight: weight, key: fish.key)
                    fishArray.append(cAtch)
            }
            handler(fishArray)
        }
    }
}
