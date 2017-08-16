//
//  ErrorResponseModel.swift
//  Ethereum wallet
//
//  Created by Crystal on 20170816//.
//  Copyright © 2017 CrystalTravel. All rights reserved.
//

import UIKit
import ObjectMapper

class ErrorResponseModel: NSObject,Mappable {
    
    
    
    var statusCode : Int64?
    var message : String?
    var options : String?
    var name : String?
    var error : ErrorObject?
    var response : responseObject?
    
    
    override init() {
        
    }
    
    required init(map: Map) {
    }
    
    func mapping(map: Map) {
        statusCode <- map["statusCode"]
        message <- map["message"]
        options <- map["options"]
        name <- map["name"]

        error <- map["error"]
        response <- map["response"]

        
        
        
        
    }
}
class responseObject: NSObject,Mappable {
    
    
    
    var body : String?
    var statusCode : String?
       var headers : String?
    var request : String?
    
    override init() {
        
    }
    
    required init(map: Map) {
    }
    
    func mapping(map: Map) {
        headers <- map["headers"]
        request <- map["request"]
         statusCode <- map["statusCode"]
               body <- map["body"]
        
    }
}
class ErrorObject: NSObject,Mappable {
    
    
    
    var message : String?
    var status : String?

    
    
    override init() {
        
    }
    
    required init(map: Map) {
    }
    
    func mapping(map: Map) {
        message <- map["message"]
        status <- map["status"]
     
        
    }
}
