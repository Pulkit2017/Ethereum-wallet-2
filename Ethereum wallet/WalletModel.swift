//
//  WalletModel.swift
//  Ethereum wallet
//
//  Created by Crystal on 20170810//.
//  Copyright © 2017 CrystalTravel. All rights reserved.
//

import UIKit
import UIKit
import ObjectMapper

class WalletModel: NSObject,Mappable {
    
    
    
    var blockHash : String?
    var blockNumber : String?
    var confirmations : String?
    var contractAddress : String?
    var cumulativeGasUsed : String?
    var from : String?
    var gas : String?
    var gasPrice : String?
    var gasUsed : String?
    var hashCode : String?
    var input : String?
    var isError : String?
    var nonce : String?
    var timeStamp : String?
    var to : String?
    var transactionIndex : String?
    var value : String?
    
    
    
    override init() {
        
    }
    
    required init(map: Map) {
    }
    
    func mapping(map: Map) {
        
        blockHash <- map["blockHash"]
        blockNumber <- map["blockNumber"]
        confirmations <- map["confirmations"]
        contractAddress <- map["contractAddress"]
        cumulativeGasUsed <- map["cumulativeGasUsed"]
        from <- map["from"]
        gas <- map["gas"]
        gasPrice <- map["gasPrice"]
        gasUsed <- map["gasUsed"]
        hashCode <- map["hash"]
        input <- map["input"]
        isError <- map["isError"]
        nonce <- map["nonce"]
        timeStamp <- map["timeStamp"]
        to <- map["to"]
        transactionIndex <- map["transactionIndex"]
        value <- map["value"]
               
        
        
        
        
    }
}
