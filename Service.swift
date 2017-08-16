//
//  Service.swift
//  Ethereum wallet
//
//  Created by Crystal on 20170808//.
//  Copyright © 2017 CrystalTravel. All rights reserved.
//

import UIKit
import ObjectMapper
import Alamofire



class Service: NSObject {
    public enum MethodName : String{
        // ** ** Api Detail
        
        case register  = "register/"
        case login =  "login/"
        case ethereumWallet = "wallet/ethereum/"
        case ethereumHistory  = "wallet/ethereum/history/"
        case createEthereumWallet = "wallet/ethereum/create/"
        case sendFundEthereum  = "wallet/ethereum/send/"
        
        
        
    }
    
    static let applinkUrl  = "http://139.59.27.120:8080/"
    
    fileprivate static func setHeader() -> [String : String] {
        var dictionary = [
            
            "ContentType": "application/json"
           
        ];
        
        print(dictionary)
        return dictionary;
    }
    
    
    static func postRequest (method:MethodName ,params:[String: AnyObject],callback:@escaping(String,Bool) -> Void)
    {
        print("postRequest : \(method)")
        print("params : \(params)")
        
         var endPoint =  Service.applinkUrl + method.rawValue ;

        Alamofire.request(endPoint, method: .post, parameters: params, encoding: JSONEncoding.default, headers:setHeader())
            .responseJSON { response in
                
                var jsonString = NSString(data: response.data!, encoding: String.Encoding.utf8.rawValue)! as String
                
                print(jsonString)
                print(response.request as Any)  // original URL request
                print(response.response as Any) // URL response
                print(response.result.value as Any)   // result of response serialization
        }
        
        
    }
    
    
    fileprivate static func requestCallBack(result:Result<AnyObject> ,  callback: (AnyObject,Bool) -> Void)
    {
            let requestOutcome = result.value;
        if(result.isSuccess) {
            //    print(result.value)
        
            callback(requestOutcome! ,true);
        } else {
            callback(requestOutcome!,true);
        }

    }
}




