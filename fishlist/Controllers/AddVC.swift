//
//  AddVC.swift
//  fishlist
//
//  Created by Andre Burgoyne on 2019-10-28.
//  Copyright © 2019 Andre Burgoyne. All rights reserved.
//

import UIKit
import Firebase

class AddVC: UIViewController {
    
    //outlets
    @IBOutlet weak var speciesTxtField: UITextField!
    @IBOutlet weak var lengthTxtField: UITextField!
    @IBOutlet weak var girthTxtField: UITextField!
    @IBOutlet weak var weightTxtField: UITextField!
    @IBOutlet weak var lureTxtField: UITextField!
    @IBOutlet weak var addBtn: RoundedButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }
    
    @IBAction func addBtnPressed(_ sender: Any) {
        if speciesTxtField.text != nil {
            addBtn.isEnabled = false
            DataService.instance.uploadFish(withSpecies: speciesTxtField.text!, andLength: lengthTxtField.text!, andGirth: girthTxtField.text!, andWeight: weightTxtField.text!, andBait: lureTxtField.text!, forUID: Auth.auth().currentUser!.uid) { (isComplete) in
                if isComplete {
                    self.addBtn.isEnabled = true
                    self.dismiss(animated: true, completion: nil)
                } else {
                    self.addBtn.isEnabled = true
                    print("Error uploading fish to Firebase!")
                }
            }
        }
    }
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func addBtnLogic() {
        if speciesTxtField.text != "" {
            //enable button
        } else {
            //disable button
        }
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
