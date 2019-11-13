//
//  MenuVC.swift
//  fishlist
//
//  Created by Andre Burgoyne on 2019-10-21.
//  Copyright © 2019 Andre Burgoyne. All rights reserved.
//

import UIKit
import FirebaseAuth

class MenuVC: UIViewController {
    
    //outlets
    @IBOutlet weak var loginBtn: UIButton!
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue){}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        self.revealViewController()?.rearViewRevealWidth = self.view.frame.size.width - 60
        isLoggedIn()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        isLoggedIn()
    }
    
    @IBAction func addBtnPressed(_ sender: Any) {
        if Auth.auth().currentUser != nil {
            performSegue(withIdentifier: TO_ADD_FISH, sender: nil)
        }
    }
    
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        if Auth.auth().currentUser != nil {
            performSegue(withIdentifier: TO_EDIT_PROFILE, sender: nil)
        } else {
            performSegue(withIdentifier: TO_LOGIN, sender: nil)
        }
    }
    
    func isLoggedIn() {
        if Auth.auth().currentUser != nil {
            loginBtn.setTitle(Auth.auth().currentUser?.email, for: .normal)
        } else {
            loginBtn.setTitle("Login", for: .normal)
        }
    }
}
