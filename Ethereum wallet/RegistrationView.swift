//
//  RegistrationView.swift
//  Ethereum wallet
//
//  Created by Crystal on 20170809//.
//  Copyright © 2017 CrystalTravel. All rights reserved.
//

import UIKit
protocol registerDelegate:class {
    func isValidateRegistration(flag : Bool)
    //func passLocationAirline(object: AirlineResonseModel,type : String)
}

class RegistrationView: UIView,UITextFieldDelegate {
    
    
        weak var delegate:registerDelegate?
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var phoneTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var reenterPasswordTextField: UITextField!
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var registerButton: UIButton!
    
    
    // MARK: - Initializers
    
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
        registerButton.addTarget(self, action: #selector(validationCheck(button:)), for: UIControlEvents.touchUpInside)
        nameTextField.addTarget(self, action: #selector(textFieldDidChangee(textField:)), for: UIControlEvents.editingChanged)
        nameTextField.delegate = self
        phoneTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        reenterPasswordTextField.delegate = self
        
        addSubview(view)
    }
    
    // Loads a XIB file into a view and returns this view.
    fileprivate func viewFromNibForClass() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string != ""
        {
        if((nameTextField == textField && (nameTextField.text?.characters.count)! + 1 > 50))
        {
            return false
        }
        else if((phoneTextField == textField && (phoneTextField.text?.characters.count)! + 1 > 10))
        {
            return false
        }
        else if(passwordTextField == textField && (passwordTextField.text?.characters.count)! + 1 > 16)
        {
            return false
        }
        else if(reenterPasswordTextField == textField && (reenterPasswordTextField.text?.characters.count)! + 1 > 16)
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
        
        if(nameTextField.text == "")
        {
            let alert = UIAlertController(title: "Error", message: "Please insert name", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.default, handler: nil))
            
            if(self.next?.next?.isKind(of: UIViewController.self))!
            {
                
                (self.next?.next as! UIViewController).present(alert, animated: true, completion: nil)
            }
            
        }
        else if(phoneTextField.text?.characters.count != 10 || phoneTextField.text?.characters.count == 0   )
        {
            let alert = UIAlertController(title: "Error", message: "Phone number lenght should be 10 and non empty ", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.default, handler: nil))
            
            if(self.next?.next?.isKind(of: UIViewController.self))!
            {
                
                (self.next?.next as! UIViewController).present(alert, animated: true, completion: nil)
            }
            
        }
        else if !(Validation.emailValidation(txtFieledEmail:emailTextField.text!))
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
        else if((reenterPasswordTextField.text?.characters.count)! > 16 || reenterPasswordTextField.text?.characters.count == 0   )
        {
            let alert = UIAlertController(title: "Error", message: "Password lenght should be less than 16 and non empty", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.default, handler: nil))
            
            if(self.next?.next?.isKind(of: UIViewController.self))!
            {
                (self.next?.next as! UIViewController).present(alert, animated: true, completion: nil)
            }
        }
        else if(reenterPasswordTextField.text != passwordTextField.text)
        {
            let alert = UIAlertController(title: "Error", message: "Password do not match Please enter again", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.default, handler: nil))
            
            if(self.next?.next?.isKind(of: UIViewController.self))!
            {
                (self.next?.next as! UIViewController).present(alert, animated: true, completion: nil)
            }
        }
        else{
            delegate?.isValidateRegistration(flag: true)
        }
    }
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
        }
        
        func textFieldDidChangee(textField: UITextField) {
            if((nameTextField.text?.characters.count)! > 20)
            {
                
            }
            else{
                
            }
        }
    
    
    
    @IBAction func hideView(_ sender: Any) {
        
        UIView.animate(withDuration: 0.7) { 
            self.alpha = 0.0
        }
    }
        
        
    
}
