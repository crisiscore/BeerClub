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
import CoreData
import SDWebImage

class ViewController: UIViewController {

    @IBOutlet weak var beerCollectionView: UICollectionView!
    
    var managedObjectContext: NSManagedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var beerList : [BeerVO] = []
    
    var beerNSList : [Beers] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.beerCollectionView.dataSource = self
        self.beerCollectionView.delegate = self
        
        let nib = UINib(nibName: "BeerCollectionViewCell", bundle: nil)
        beerCollectionView.register(nib, forCellWithReuseIdentifier: "BeerCollectionViewCell")
        
        loadBeers()
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        getBeers()
    }
    
    func getBeers() {
        do{
            beerNSList = try managedObjectContext.fetch(Beers.fetchRequest())
            self.beerCollectionView.reloadData()
        }catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    func addBeers()  {
        
        beerList.forEach { (beerVO) in
            
            let entity = NSEntityDescription.entity(forEntityName: "Beers", in: managedObjectContext)
            
            let beer = NSManagedObject(entity: entity!, insertInto: managedObjectContext)
            
            beer.setValue( beerVO.id, forKey: "id")
            beer.setValue(beerVO.abv, forKey: "abv")
            beer.setValue(beerVO.brewers_tips, forKey: "brewers_tips")
            beer.setValue(beerVO.contributed_by, forKey: "contributed_by")
           // beer.setValue(beerVO.description, forKey: "description")
            beer.setValue(beerVO.first_brewed, forKey: "first_brewed")
          //  beer.setValue(beerVO.food_pairing, forKey: "food_pairing")
            beer.setValue(beerVO.image_url, forKey: "image_url")
          //  beer.setValue(beerVO.ingredients, forKey: "ingredients")
            beer.setValue(beerVO.name, forKey: "name")
            
            do {
                try managedObjectContext.save()
            } catch {
                print("Failed saving")
            }
            
        }
        
        self.beerCollectionView.reloadData()

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
                    
                    self.addBeers()
                    
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
        return beerNSList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BeerCollectionViewCell", for: indexPath) as! BeerCollectionViewCell
        
     //   let beer  = beerList[indexPath.row]
        let beer  = beerNSList[indexPath.row]
        
        cell.tvBeerName.text = beer.name
        cell.ivBeerImage.sd_setImage(with: URL(string: beer.image_url!), placeholderImage: UIImage(named: "beer"))
        
        return cell
    }
    
    
}

extension ViewController : UICollectionViewDelegate , UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let nav = self.storyboard?.instantiateViewController(withIdentifier : "DetailsViewController") as! UINavigationController
        
        let vc = nav.viewControllers[0] as! DetailsViewController
        
        vc.mBeer = beerNSList[indexPath.row]
        
        self.present( nav  , animated: true , completion: nil)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
     
        let w = self.view.frame.width / 2 - 16
        
        return CGSize(width: w, height: w * 1.5)
    }
    
}

