//
//  RecordVC.swift
//  fishlist
//
//  Created by Andre Burgoyne on 2019-10-21.
//  Copyright © 2019 Andre Burgoyne. All rights reserved.
//

import UIKit

class RecordVC: UIViewController {
    
    //outlets
    @IBOutlet weak var menuBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
    }
}
