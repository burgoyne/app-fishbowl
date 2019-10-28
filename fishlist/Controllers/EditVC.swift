//
//  EditVC.swift
//  fishlist
//
//  Created by Andre Burgoyne on 2019-10-25.
//  Copyright © 2019 Andre Burgoyne. All rights reserved.
//

import UIKit
import FirebaseAuth

class EditVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func updateBtnPressed(_ sender: Any) {
        //use firebase auth to update email address
        
        //use firestore to update new info 
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func logoutBtnPressed(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            dismiss(animated: true, completion: nil)
        } catch let error as NSError {
            print (error.localizedDescription)
        }
    }
}