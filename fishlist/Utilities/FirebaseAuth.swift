//
//  FirebaseAuth.swift
//  fishlist
//
//  Created by Andre Burgoyne on 2019-10-23.
//  Copyright © 2019 Andre Burgoyne. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class FirebaseAuth {
    static let instance = FirebaseAuth()
    
    func createUser(withEmail email: String, andPassword password: String, userCreationComplete: @escaping (_ status: Bool, _ error: Error?) -> ()) {
        Auth.auth().createUser(withEmail: email, password: password) { (authDataResult, error) in
            guard let authDataResult = authDataResult else {
                userCreationComplete(false, error)
                return
            }
            
            let userData = ["provider": authDataResult.user.providerID, "email": authDataResult.user.email]
            DataService.instance.createDbUser(uid: authDataResult.user.uid, userData: userData)
            userCreationComplete(true, nil)
        }
    }
    
    func signIn(withEmail email: String, andPassword password: String, loginComplete: @escaping (_ status: Bool, _ error: Error?) -> ()) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if error != nil {
                loginComplete(false, error)
                return
            }
            loginComplete(true, nil)
        }
    }
    
}

