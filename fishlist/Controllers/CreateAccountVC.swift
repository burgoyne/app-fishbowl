//
//  CreateAccountVC.swift
//  fishlist
//
//  Created by Andre Burgoyne on 2019-10-22.
//  Copyright © 2019 Andre Burgoyne. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {
    
    //outlets
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func createBtnPressed(_ sender: Any) {
        let signUpManager = FirebaseAuth()
        if let email = emailTxtField.text, let password = passwordTxtField.text {
            signUpManager.createUser(withEmail: email, andPassword: password) {[weak self] (success, registrationError) in
                guard let `self` = self else { return }
                var message: String = ""
                if (success) {
                    signUpManager.signIn(withEmail: email, andPassword: password) { (success, registrationError) in
                        //guard let `self` = self else { return }
                        if (success) {
                            self.performSegue(withIdentifier: UNWIND, sender: nil)
                        } else {
                            message = "There was an error logging you in."
                        }
                    }
                } else {
                    message = "Unable to create account. Please try again."
                }
                let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                //self.display(alertController: alertController)
                self.show(alertController, sender: nil)
            }
        }
    }
    
    @IBAction func chooseAvatarBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_AVATAR_PICKER, sender: nil)
    }
    
    @IBAction func generateBGBtnPressed(_ sender: Any) {
    }
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
}
