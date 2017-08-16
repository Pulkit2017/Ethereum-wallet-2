//
//  WalletViewController.swift
//  Ethereum wallet
//
//  Created by Crystal on 20170810//.
//  Copyright © 2017 CrystalTravel. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
import SwiftyJSON




class WalletViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,sendFundsDelegate {
    
    
    
    @IBOutlet weak var sendFundView: SendFundsView!
    
    @IBOutlet weak var historyTableView: UITableView!
    var id : String?
    var token = String()
    var walletModel = [WalletModel]()

    @IBOutlet weak var balanceLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        sendFundView.delegate = self
        //getWallet(url: "wallet/ethereum/history/")
        let nib1 = UINib(nibName: "WalletHistoryTableViewCell", bundle: nil)
        
        historyTableView.register(nib1, forCellReuseIdentifier: "WalletHistoryTableViewCell")
      
        getWallet(url: "wallet/ethereum/",type: HTTPMethod.get, params: [String : String]())
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sendAction(_ sender: Any) {
        UIView.animate(withDuration: 0.5) { 
                   self.sendFundView.alpha  = 1.0
        }
 
    }
    func sendFunds(id: String, amountText: String) {
          var param = [String:String]()
        
        param  = [
            "to": id,
            "amount": amountText
            
        ]
        
        //ISSUE WITH SEND FUNDS
        getWallet(url: "wallet/ethereum/send/",type: HTTPMethod.post,params: param)
    }
    func getWallet(url:String,type:HTTPMethod,params:[String:String]!)
        
    {
        
        var dictionary = [
            
            "x-access-token": token
            
        ];
                 if(url == "wallet/ethereum/create/" || url == "wallet/ethereum/send/" )
          {
            dictionary = [
                 "Content-Type": "application/json",
               "x-access-token": token
              
            ]
        }
      
        
        request("\(Service.applinkUrl)\(url)", method: type, parameters: nil, encoding: JSONEncoding.default, headers: dictionary as? HTTPHeaders).responseJSON { response in
         let statusCode = response.response?.statusCode
           if(statusCode != nil)
           {
            if(statusCode == 200)
            {
            if(url == "wallet/ethereum/")
            {
                let jsonDictionary =   response.result.value as! NSDictionary
                
                if let val = jsonDictionary["account"] {
                    let account  = jsonDictionary.value(forKey: "account") as! NSDictionary
                    let balance = jsonDictionary.value(forKey: "balance") as! String
                    self.balanceLabel.text = balance
                    self.getWallet(url: "wallet/ethereum/history/",type: HTTPMethod.get, params: [String : String]())
                    
                } else {
                    
                    let alert = UIAlertController(title: "Wallet not found", message: "Please create wallet", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
                
                
            }
            else if(url == "wallet/ethereum/create/")
            {
                
                
                
                 let alert = UIAlertController(title: "Success", message: "Wallet Created", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
                
            }
                else if(url == "wallet/ethereum/send/")
            {
                
            }
            else{
                let jsonDictionary =   response.result.value! as! NSDictionary
                let json = JSON(jsonDictionary.value(forKey: "result"))
                self.walletModel =   Mapper<WalletModel>().mapArray(JSONObject: json.object)!
                
                print(self.walletModel)
                self.historyTableView.reloadData()
                
                
            }
            
        
            
            print(response.request as Any)  // original URL request
            print(response.response as Any) // URL response
            print(response.result.value! as Any)   // result of response serialization
            }
            else{
                let alert = UIAlertController(title: "Error", message: "Please try again", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                print(response.request as Any)  // original URL request
                print(response.response as Any) // URL response
            }
            
        }
           else{
            
            }
        }
        
        
    }
    @IBAction func createWalletAction(_ sender: Any) {
        getWallet(url: "wallet/ethereum/create/",type: HTTPMethod.post, params: [String : String]())
    }
    
    @IBAction func sendFunction(sender:Any)
    {
        let alert = UIAlertController(title: "Error", message: "Please try again", preferredStyle: UIAlertControllerStyle.alert)
        
       
        alert.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.default, handler: nil))
       
         getWallet(url: "wallet/ethereum/create/",type: HTTPMethod.post, params: [String : String]())
    }
    @IBAction func logout(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
