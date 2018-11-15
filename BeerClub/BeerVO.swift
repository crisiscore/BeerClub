//
//  BeerVO.swift
//  BeerClub
//
//  Created by Crisis Core on 11/15/18.
//  Copyright © 2018 PADC. All rights reserved.
//

import Foundation
import SwiftyJSON

class BeerVO: Codable {
    
    var id : Int = -1
    
    var name : String? = nil
    
    var tagline : String? = nil
    
    var first_brewed : String? = nil
    
    var description : String? = nil
    
    var image_url : String? = nil
    
    var ingredients : IngredientVO? = nil
    
    var food_pairing : [String]? = nil
    
    var brewers_tips : String? = nil
    
    var contributed_by : String? = nil
    
    static func parseToBeerVO(_ data : JSON) -> BeerVO {
        
        let beer = BeerVO()
     //   beer.id = data["id"] as Int
        beer.name = data["name"].string
        beer.tagline = data["tagline"].string
        beer.first_brewed  = data["first_brewed"].string
        beer.description = data["description"].string
        beer.image_url = data["image_url"].string
    //    beer.ingredients = data["ingredients"].string
      //  beer.food_pairing = data["food_pairing"].string
        beer.brewers_tips = data["brewers_tips"].string
        beer.contributed_by = data["contributed_by"].string
        
        return beer
    }
    
}
