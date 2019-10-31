//
//  Catches.swift
//  fishlist
//
//  Created by Andre Burgoyne on 2019-10-29.
//  Copyright © 2019 Andre Burgoyne. All rights reserved.
//

import Foundation
import Firebase

struct Catches: Identifiable {

let ref: DatabaseReference?
let key: String
let species: String
let weight: String
let id: String

init(species: String, weight: String, key: String = "") {
    self.ref = nil
    self.key = key
    self.species = species
    self.weight = weight
    self.id = key
}
init?(snapshot: DataSnapshot) {
    guard
        let value = snapshot.value as? [String: AnyObject],
        let species = value["species"] as? String,
        let weight = value["weight"] as? String
        else {
            return nil
        }
    self.ref = snapshot.ref
    self.key = snapshot.key
    self.species = species
    self.weight = weight
    self.id = snapshot.key
}

func toAnyObject() -> Any {
    return [
        "species": species,
        "weight": weight,
    ]
}
}
