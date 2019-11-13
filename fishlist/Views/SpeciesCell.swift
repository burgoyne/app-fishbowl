//
//  SpeciesCell.swift
//  fishlist
//
//  Created by Andre Burgoyne on 2019-11-08.
//  Copyright © 2019 Andre Burgoyne. All rights reserved.
//

import UIKit

class SpeciesCell: UITableViewCell {
    
    //outlets
    @IBOutlet weak var speciesImg: UIImageView!
    @IBOutlet weak var speciesLbl: UILabel!
    
    
    func configureCell(speciesImage: UIImage, speciesName: String) {
        self.speciesImg.image = speciesImage
        self.speciesLbl.text = speciesName
    }
}
