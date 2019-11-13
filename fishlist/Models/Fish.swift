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
    private var _fishLength: String
    private var _fishGirth: String
    private var _fishWeight: String
    private var _fishBait: String
    private var _senderId: String
    
    var fishSpecies: String {
        return _fishSpecies
    }
    var fishLength: String {
        return _fishLength
    }
    var fishGirth: String {
        return _fishGirth
    }
    var fishWeight: String {
        return _fishWeight
    }
    var fishBait: String {
        return _fishBait
    }
    var senderId: String {
        return _senderId
    }
    
    init(species: String, length: String, girth: String, weight: String, bait: String, senderId: String) {
        self._fishSpecies = species
        self._fishLength = length
        self._fishGirth = girth
        self._fishWeight = weight
        self._fishBait = bait
        self._senderId = senderId
    }
}
