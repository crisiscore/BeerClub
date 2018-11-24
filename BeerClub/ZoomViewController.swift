//
//  ZoomViewController.swift
//  BeerClub
//
//  Created by Crisis Core on 11/18/18.
//  Copyright © 2018 PADC. All rights reserved.
//

import UIKit

class ZoomViewController: UIViewController , UIScrollViewDelegate{

    @IBOutlet weak var scrollView: UIScrollView!
    
    
    @IBOutlet weak var ivBeer: UIImageView!
    
    var url : String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

         ivBeer.sd_setImage(with: URL(string: url!), placeholderImage: UIImage(named: "beer"))
        
        scrollView.delegate = self
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 6.0
        
    }
    
    private func scrollViewDidZoom(_ scrollView: UIScrollView) -> UIView {
        return ivBeer
    }
    
    @IBAction func back(_ sender: Any) {
         self.dismiss(animated: true, completion: nil)
    }
    
}
