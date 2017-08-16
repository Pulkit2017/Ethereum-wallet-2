//
//  LoginView.swift
//  Ethereum wallet
//
//  Created by Crystal on 20170809//.
//  Copyright © 2017 CrystalTravel. All rights reserved.
//

import UIKit
protocol loginDelegate:class {
    func isValidateLogin(flag : Bool)
    //func passLocationAirline(object: AirlineResonseModel,type : String)
}
class LoginView: UIView,UITextFieldDelegate {
    // MARK: - Initializers
            weak var delegate:loginDelegate?
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    // MARK: - Private Helper Methods
    
    // Performs the initial setup.
    fileprivate func setupView() {
        let view = viewFromNibForClass()
        view.frame = bounds
        view.autoresizingMask = [
            UIViewAutoresizing.flexibleWidth,
            UIViewAutoresizing.flexibleHeight
        ]
        loginButton.addTarget(self, action: #selector(validationCheck(button:)), for: UIControlEvents.touchUpInside)
        emailTextField.delegate = self
        passwordTextField.delegate = self
        addSubview(view)
    }
    
    // Loads a XIB file into a view and returns this view.
    fileprivate func viewFromNibForClass() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    @IBAction func hideView(_ sender: Any) {
        UIView.animate(withDuration: 0.7) { 
            self.alpha = 0.0
        }
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string != ""
        {
           
            if(passwordTextField == textField && (passwordTextField.text?.characters.count)! + 1 > 16)
            {
                return false
            }
            else{
                return true
            }
        }
        else{
            return true
        }
    }
    
    func validationCheck(button: UIButton) {
        
       
         if !(Validation.emailValidation(txtFieledEmail:emailTextField.text!))
        {
            let alert = UIAlertController(title: "Error", message: "Please insert correct email id", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.default, handler: nil))
            
            if(self.next?.next?.isKind(of: UIViewController.self))!
            {
                
                (self.next?.next as! UIViewController).present(alert, animated: true, completion: nil)
            }
            
        }
            
        else if((passwordTextField.text?.characters.count)! > 16 || passwordTextField.text?.characters.count == 0   )
        {
            let alert = UIAlertController(title: "Error", message: "Password lenght should be less than 16 and non empty", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.default, handler: nil))
            
            if(self.next?.next?.isKind(of: UIViewController.self))!
            {
                (self.next?.next as! UIViewController).present(alert, animated: true, completion: nil)
            }
        }
       
        else{
            delegate?.isValidateLogin(flag: true)
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
   
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
