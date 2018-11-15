//
//  BeerCollectionViewCell.swift
//  BeerClub
//
//  Created by Crisis Core on 11/12/18.
//  Copyright © 2018 PADC. All rights reserved.
//

import UIKit

class BeerCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var ivBeerImage: UIImageView!
    
    @IBOutlet weak var tvBeerName: UILabel!
    
    @IBOutlet weak var tvBeerDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
