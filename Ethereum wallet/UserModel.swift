//
//  UserModel.swift
//  Ethereum wallet
//
//  Created by Crystal on 20170808//.
//  Copyright © 2017 CrystalTravel. All rights reserved.
//

import UIKit
import ObjectMapper

class UserModel: NSObject,Mappable {
    
    
    
    var token : String?
    var idString : String?
    
    override init() {
        
    }
    
    required init(map: Map) {
    }
    
    func mapping(map: Map) {
        token <- map["token"]
        idString <- map["_id"]
        
        
        
        
    }
}
