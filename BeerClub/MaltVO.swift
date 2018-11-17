//
//  MaltVO.swift
//  BeerClub
//
//  Created by Crisis Core on 11/17/18.
//  Copyright © 2018 PADC. All rights reserved.
//

import Foundation
import SwiftyJSON
class MaltVO {
    

var name: String? = nil
var amountValue: Double? = nil


static func parseToMaltArray(_ data : JSON) -> MaltVO{
    let malt = MaltVO()
    malt.name = data["name"].string
    malt.amountValue = data["amount"]["value"].double
    
    return malt
}

static func parse(_ data : JSON) -> MaltVO{
    let malt = MaltVO()
    malt.name = data["name"].string
    malt.amountValue = data["amount"]["value"].double
    
    return malt
}

static func parseData(name: String, amount: Double) -> MaltVO{
    let malt = MaltVO()
    malt.name = name
    malt.amountValue = amount
    
    return malt
}
}
