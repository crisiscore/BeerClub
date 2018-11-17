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
    
    @IBOutlet weak var tvDate: UILabel!
    
    @IBOutlet weak var tvDescription: UILabel!
    
    @IBOutlet weak var tvBewareTips: UILabel!
    
    @IBOutlet weak var tvContributedBy: UILabel!
    
    var mBeer : BeerVO = BeerVO()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ivBeer.sd_setImage(with: URL(string: mBeer.image_url!), placeholderImage: UIImage(named: "beer"))
        
        tvName.text = mBeer.name
        tvDate.text = mBeer.first_brewed
        tvDescription.text = mBeer.description
        tvBewareTips.text = mBeer.brewers_tips
        tvContributedBy.text = mBeer.contributed_by
        
    }
    

    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}