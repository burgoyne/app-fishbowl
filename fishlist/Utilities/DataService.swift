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
    private var _REF_FISH = DB_BASE.child("fish")
    
    var REF_BASE: DatabaseReference {
        return _REF_BASE
    }
    
    var REF_USERS: DatabaseReference {
        return _REF_USERS
    }
    
    var REF_FISH: DatabaseReference {
        return _REF_FISH
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
    
    func uploadFish(withSpecies species: String, andLength length: String, andGirth girth: String, andWeight weight: String, andBait bait: String, forUID uid: String, sendComplete: @escaping (_ status: Bool) -> () ) {
        REF_FISH.childByAutoId().updateChildValues(["name": species, "length": length, "girth": girth, "weight": weight, "bait": bait, "senderId": uid])
        sendComplete(true)
    }
    
    func getAllFish(handler: @escaping (_ fishes: [Fish]) -> ()) {
        var fishArray = [Fish]()
        REF_FISH.observeSingleEvent(of: .value) { (fishSnapshot) in
            guard let fishSnapshot = fishSnapshot.children.allObjects as? [DataSnapshot] else { return }
            for fish in fishSnapshot {
                let species = fish.childSnapshot(forPath: "name").value as! String
                let length = fish.childSnapshot(forPath: "length").value as! String
                let girth = fish.childSnapshot(forPath: "girth").value as! String
                let weight = fish.childSnapshot(forPath: "weight").value as! String
                let bait = fish.childSnapshot(forPath: "bait").value as! String
                let senderId = fish.childSnapshot(forPath: "senderId").value as! String
                
                let fishCatch = Fish(species: species, length: length, girth: girth, weight: weight, bait: bait, senderId: senderId)
                fishArray.append(fishCatch)
            }
            handler(fishArray)
        }
    }
}
