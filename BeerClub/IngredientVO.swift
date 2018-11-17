//
//  IngredientVO.swift
//  BeerClub
//
//  Created by Crisis Core on 11/15/18.
//  Copyright © 2018 PADC. All rights reserved.
//

import Foundation
import SwiftyJSON

class IngredientVO {
    var maltArr: [MaltVO]? = nil
    var hopsArr: [HopsVO]? = nil
    var yeast: String? = nil
    
    static func parseToIngredientVO(_ data: JSON) -> IngredientVO {
        let ingredientsVO = IngredientVO()
        
        ingredientsVO.maltArr = data["malt"].arrayObject as? [MaltVO]
        ingredientsVO.hopsArr = data["hops"].arrayObject as? [HopsVO]
        ingredientsVO.yeast = data["yeast"].string
        
        return ingredientsVO
    }
}
