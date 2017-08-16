//
//  ValidationClass.swift
//  ValidationInSwift
//
//  Created by Dotsquares on 04/11/15.
//  Copyright © 2015 Dotsquares. All rights reserved.
//

import UIKit
import AVFoundation

class Validation: NSObject{
    
    class func emailValidation(txtFieledEmail: String)-> Bool{
        let emailRegEx = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: txtFieledEmail)
    }
    
    class func phoneNoValidation(txtFieldPhone:String)-> Bool{
        //let phoneNumber = "(800) 555-1111"
        let PhoneNo = "^\\d{3}-\\d{3}-\\d{4}$"
        let phoneNoTest = NSPredicate(format:"SELF MATCHES %@", PhoneNo)
        return phoneNoTest.evaluate(with: txtFieldPhone);
//        let charcter  = NSCharacterSet(charactersInString: "0123456789").invertedSet
//        var filtered:NSString!
//        let inputString:NSArray = txtFieldPhone.componentsSeparatedByCharactersInSet(charcter)
//        filtered = inputString.componentsJoinedByString("")
//        return  txtFieldPhone == filtered
    }
    
    class func phoneNumberLengthValidation(pNumber : String) -> Bool{
        
        if pNumber.characters.count > 15{
            return true
            
        }
        return false
    }
    
    class func stringDoesNotExceed(pNumber : String,length : String )-> Bool{
        if pNumber.characters.count > (length as NSString).integerValue{
            return true
            
        }
        return false
        
    }
    
    class func specialCharacterNotEnter(txtField:String)->Bool{
        
        
        
        let characterSet:NSCharacterSet = NSCharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ0123456789").inverted as NSCharacterSet
            
         //   NSCharacterSet(charactersInString: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ0123456789").invertedSet
        var filtered:NSString!
        let inputString:[String] = txtField.components(separatedBy: characterSet as CharacterSet)
           var filteredArray:NSArray!
            //txtField.componentsSeparatedByCharactersInSet(characterSet)
      for stringObj in inputString
      {
        filtered.appending(stringObj)
        
        }
        filtered = filteredArray.componentsJoined(by: "") as NSString
        return txtField == filtered as String;
        
    }
 
    class func PasswordAndConfirmPasswordMatch(txtfieldone:String,secondValue txtfieldTwo:String)->Bool{
        if txtfieldone != txtfieldTwo{
            return true;
            
        }
        return false;
        
    }
    class func emptyTextFeild(txtfieldone:String )->Bool {
        return txtfieldone.isEmpty
    }
    
    class func postCodeValidation(txtfieldone:String )->Bool{
        if txtfieldone.characters.count < 5{
            return true
            
        }
        return false
    }
    
    
    class func passwordValidation(txtfielphone:String)->Bool{
        if txtfielphone.characters.count < 5{
            return true
           
        }
        if txtfielphone.characters.count > 16{
            return true
            
        }
            
        return false;
    }
    
    
    class func checkSpaceInPassword(txtField: String) -> Bool{
        
        let whitespace = NSCharacterSet.whitespaces
        let range = txtField.rangeOfCharacter(from: whitespace)
        
        // range will be nil if no whitespace is found
        if ((range?.isEmpty) != nil) {
           return true
        }
        return false
    }
    
    class func validationContaingSpecialCharacterDigitCharacher(txtField: String) ->Bool{
        // let Validl = "^[\w\s*\W]{8}$"
        let ValidlRegEx = "^[[a-z]\\d\\s@!#$%^&*_|-]{6}$"
        let Test = NSPredicate(format:"SELF MATCHES %@", ValidlRegEx)
        return Test.evaluate(with: txtField)
    }
    
    
    class func validateStringDigit(txtField: String, length : String) ->Bool{
        return txtField.characters.count == (length as NSString).integerValue ? true : false
    }
    
    
    
    class func validationWhiteSpace(txtField: String)->Bool{
        let characterSet:NSCharacterSet = NSCharacterSet.whitespacesAndNewlines as NSCharacterSet

       // let characterSet:NSCharacterSet = NSCharacterSet .whitespaceAndNewlineCharacterSet()
        let filtered:NSString = txtField .trimmingCharacters(in: characterSet as CharacterSet) as NSString
           return txtField == filtered as String;
        
    }
}
