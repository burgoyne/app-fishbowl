//
//  RecordVC.swift
//  fishlist
//
//  Created by Andre Burgoyne on 2019-10-21.
//  Copyright © 2019 Andre Burgoyne. All rights reserved.
//

import UIKit
import Firebase

class RecordVC: UIViewController {
    
    //outlets
    @IBOutlet weak var menuBtn: UIButton!
    @IBOutlet weak var speciesTableView: UITableView!
    
    var fishArray = [Fish]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        menuBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        speciesTableView.delegate = self
        speciesTableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DataService.instance.getAllFish { (returnedFish) in
            self.fishArray = returnedFish
            self.speciesTableView.reloadData()
        }
    }
}

extension RecordVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if Auth.auth().currentUser != nil {
            return fishArray.count
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
        UITableViewCell {
            if Auth.auth().currentUser != nil {
                guard let cell = speciesTableView.dequeueReusableCell(withIdentifier: "fishCell") as? SpeciesCell else { return UITableViewCell() }
                
                let image = UIImage(named: "walleye")
                let name = fishArray[indexPath.row]
                
                cell.configureCell(speciesImage: image!, speciesName: name.fishSpecies)
                return cell
            } else {
                return UITableViewCell()
            }
    }
}
