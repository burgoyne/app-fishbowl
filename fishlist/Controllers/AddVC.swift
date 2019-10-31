//
//  AddVC.swift
//  fishlist
//
//  Created by Andre Burgoyne on 2019-10-28.
//  Copyright © 2019 Andre Burgoyne. All rights reserved.
//

import UIKit

class AddVC: UIViewController {
    
    //outlets
    @IBOutlet weak var speciesTxtField: UITextField!
    @IBOutlet weak var lengthTxtField: UITextField!
    @IBOutlet weak var girthTxtField: UITextField!
    @IBOutlet weak var weightTxtField: UITextField!
    @IBOutlet weak var lureTxtField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addBtnPressed(_ sender: Any) {
        //record catch to realtime db 
    }
}
