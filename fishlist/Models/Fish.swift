//
//  Catch.swift
//  fishlist
//
//  Created by Andre Burgoyne on 2019-10-29.
//  Copyright © 2019 Andre Burgoyne. All rights reserved.
//

import Foundation

class Fish {
    private var _fishSpecies: String
    private var _fishWeight: String
    private var _key: String
    
    var fishSpecies: String {
        return _fishSpecies
    }
    var fishWeight: String {
        return _fishWeight
    }
    var key: String {
        return _key
    }
    
    init(species: String, weight: String, key: String) {
        self._fishSpecies = species
        self._fishWeight = weight
        self._key = key
    }
}
