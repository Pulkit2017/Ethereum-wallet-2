//
//  ViewController.swift
//  Ethereum wallet
//
//  Created by Crystal on 20170808//.
//  Copyright © 2017 CrystalTravel. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

class ViewController: RootViewController,loginDelegate,registerDelegate {
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registrationButton: UIButton!
    
    @IBOutlet weak var registrationView: RegistrationView!
    
    @IBOutlet weak var loginView: LoginView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registrationView.delegate = self
        loginView.delegate = self
        target()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func isValidateLogin(flag: Bool) {
        if(flag)
        {
            loginAction()
        }
    }
    func isValidateRegistration(flag: Bool) {
        if(flag)
        {
            registerAction()
        }
    }
    func target()
    {
        loginView.backButton.addTarget(self, action: #selector(showLoginAndRegistration), for: .touchUpInside)
        registrationButton.addTarget(self, action: #selector(showLoginAndRegistration), for: .touchUpInside)
           }
    func showLoginAndRegistration()
    {
        self.loginButton.alpha = 1.0
        self.registrationButton.alpha = 1.0
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func loginAction()
    {
         let params: [String : String] = ["password" : loginView.passwordTextField.text!,"email":loginView.emailTextField.text!]
        callApi(url: "login/", params: params)
    }
    func registerAction()
    {
        let params: [String : String] = ["password" : registrationView.passwordTextField.text!,"email":registrationView.emailTextField.text!,"phone":registrationView.phoneTextField.text!,"name":registrationView.nameTextField.text!]
             callApi(url: "register/", params: params)
    }
     class func mainStoryboard() -> UIStoryboard { return UIStoryboard(name: "Main", bundle: Bundle.main) }
    func callApi(url:String,params: [String : String])
    {
       
        let dictionary = [
            
            "ContentType": "application/json"
            
        ];
        
        request("\(Service.applinkUrl)\(url)", method: .post, parameters: params, encoding: JSONEncoding.default, headers: dictionary).responseJSON { response in
            let statusCode = response.response?.statusCode
                let jsonDictionary =   response.result.value! as! NSDictionary
            if(statusCode == 200)
            {
            
                let idNew = jsonDictionary.value(forKey: "_id") as! String
                let token = jsonDictionary.value(forKey: "token") as! String
                var vc =
                    UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "wallet") as? WalletViewController
                vc?.id = idNew
                vc?.token = token
                self.navigationController?.pushViewController(vc!, animated: true)
            }
            else{
                 let message = String()
                if(statusCode == 500)
                {
                    var objectNew = Mapper<ErrorResponseModel>().map(JSONObject: jsonDictionary)
                    
                    print(objectNew)
                   let message = objectNew?.error?.message
                }
                let alert = UIAlertController(title: "User not found", message: "Please try again", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            
            print(response.request as Any)  // original URL request
            print(response.response as Any) // URL response
            print(response.result.value! as Any)   // result of response serialization
        }
        
        
        
        
    }
    
    @IBAction func loginButtonAction(_ sender: Any) {
        UIView.animate(withDuration: 0.7) {
            
            self.loginView.alpha = 1.0
            self.registrationView.alpha = 0.0
            self.loginButton.alpha = 0.0
            self.registrationButton.alpha = 0.0
        }
    }
    
    @IBAction func registerButtonAction(_ sender: Any) {
        UIView.animate(withDuration: 0.7) {
            self.registrationView.alpha = 1.0
            self.loginView.alpha = 0.0
            self.loginButton.alpha = 0.0
            self.registrationButton.alpha = 0.0
        }
    }
}

