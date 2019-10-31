//
//  LoginVC.swift
//  fishlist
//
//  Created by Andre Burgoyne on 2019-10-22.
//  Copyright © 2019 Andre Burgoyne. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    //outlets
    @IBOutlet weak var usernameTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createAccountBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_CREATE_ACCOUNT, sender: nil)
    }
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        let loginManager = FirebaseAuth()
        guard let email = usernameTxtField.text, let password = passwordTxtField.text else { return }
        loginManager.signIn(withEmail: email, andPassword: password) {[weak self] (success, registrationError) in
            guard let `self` = self else { return }
            var message: String = ""
            if (success) {
                message = "User was sucessfully logged in."
            } else {
                message = "There was an error logging you in."
            }
            let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            //self.display(alertController: alertController)
            self.show(alertController, sender: nil)
        }

    }
}
