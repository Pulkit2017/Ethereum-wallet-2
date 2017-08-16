//
//  SendFundsView.swift
//  Ethereum wallet
//
//  Created by Crystal on 20170816//.
//  Copyright © 2017 CrystalTravel. All rights reserved.
//

import UIKit
protocol sendFundsDelegate:class {
    func sendFunds(id:String,amountText:String)
    //func passLocationAirline(object: AirlineResonseModel,type : String)
}
class SendFundsView: UIView,UITextFieldDelegate {
    weak var delegate : sendFundsDelegate!
    @IBOutlet weak var idTextField: UITextField!

    @IBOutlet weak var amountTextField: UITextField!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       setupView()
    }
    // Performs the initial setup.
    fileprivate func setupView() {
        let view = viewFromNibForClass()
        view.frame = bounds
        view.autoresizingMask = [
            UIViewAutoresizing.flexibleWidth,
            UIViewAutoresizing.flexibleHeight
        ]
      
     idTextField.delegate = self
         amountTextField.delegate = self
        addSubview(view)
    }
    
    // Loads a XIB file into a view and returns this view.
    fileprivate func viewFromNibForClass() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
       
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    @IBAction func closeViewAction(_ sender: Any) {
        UIView.animate(withDuration: 0.5) { 
                 self.alpha = 0.0
        }
   
    }
    @IBAction func sendFundsAction(_ sender: UIButton) {
        if(idTextField.text == "" && amountTextField.text == "")
        {
            
        }
        else{
            self.alpha = 0.0
            delegate.sendFunds(id: idTextField.text!, amountText: amountTextField.text!)
        }
    }
   
}
