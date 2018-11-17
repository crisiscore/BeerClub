//
//  DetailsViewController.swift
//  BeerClub
//
//  Created by Crisis Core on 11/16/18.
//  Copyright © 2018 PADC. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var ivBeer: UIImageView!
    
    @IBOutlet weak var tvName: UILabel!
    
    @IBOutlet weak var tvTag: UILabel!
    
    @IBOutlet weak var tvDescription: UILabel!
    
    @IBOutlet weak var tvBrewerTips: UILabel!
    
    @IBOutlet weak var tvFoodParing: UILabel!
    
    @IBOutlet weak var tvContributedBy: UILabel!
    
    var mBeer : BeerVO = BeerVO()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ivBeer.sd_setImage(with: URL(string: mBeer.image_url!), placeholderImage: UIImage(named: "beer"))
        
       tvName.text = mBeer.name
       tvTag.text = mBeer.tagline
       tvDescription.text = mBeer.description
      tvBrewerTips.text = mBeer.brewers_tips
        tvFoodParing.text = mBeer.food_pairing?[0]
        tvContributedBy.text = mBeer.contributed_by
        
    }
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
