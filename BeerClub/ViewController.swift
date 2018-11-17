//
//  ViewController.swift
//  BeerClub
//
//  Created by Crisis Core on 11/12/18.
//  Copyright © 2018 PADC. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SDWebImage

class ViewController: UIViewController {

    @IBOutlet weak var beerCollectionView: UICollectionView!
    
    var beerList : [BeerVO] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.beerCollectionView.dataSource = self
        self.beerCollectionView.delegate = self
        
        let nib = UINib(nibName: "BeerCollectionViewCell", bundle: nil)
        beerCollectionView.register(nib, forCellWithReuseIdentifier: "BeerCollectionViewCell")
        
        loadBeers()
        
    }
    
    func loadBeers()  {
        
        Alamofire.request("https://api.punkapi.com/v2/beers" , method: .get) .responseJSON { (response) in
            
            switch response.result{
                
            case .success :
                
                let api = response.result.value
                
                let json = JSON(api!)
                
                let data = json[].array
                
                if let result = data {
                    
                    var beerList : [BeerVO]  = []
                    
                    result.forEach({(beer) in
                        beerList.append(BeerVO.parseToBeerVO(beer))
                    })
                    
                    self.beerList = beerList
                    self.beerCollectionView.reloadData()
                }
                
                break
                
            case .failure :
                print("failure call")
            break
                
            }
        }
    }


}

extension ViewController : UICollectionViewDataSource {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return beerList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BeerCollectionViewCell", for: indexPath) as! BeerCollectionViewCell
        
        let beer  = beerList[indexPath.row]
        cell.tvBeerName.text = beer.name
        cell.ivBeerImage.sd_setImage(with: URL(string: beer.image_url!), placeholderImage: UIImage(named: "beer"))
        
        return cell
    }
    
    
}

extension ViewController : UICollectionViewDelegate , UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let nav = self.storyboard?.instantiateViewController(withIdentifier : "DetailsViewController") as! UINavigationController
        
        let vc = nav.viewControllers[0] as! DetailsViewController
        
        vc.mBeer = beerList[indexPath.row]
        
        self.present( nav  , animated: true , completion: nil)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
     
        let w = self.view.frame.width / 2 - 16
        
        return CGSize(width: w, height: w * 1.5)
    }
    
}

