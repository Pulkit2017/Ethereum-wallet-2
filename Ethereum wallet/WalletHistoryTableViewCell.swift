//
//  WalletHistoryTableViewCell.swift
//  Ethereum wallet
//
//  Created by Crystal on 20170810//.
//  Copyright © 2017 CrystalTravel. All rights reserved.
//

import UIKit

class WalletHistoryTableViewCell: UITableViewCell {
    @IBOutlet weak var blockHashLabel: UILabel!

    @IBOutlet weak var blockNumberLabel: UILabel!
    
    @IBOutlet weak var confirmationLabel: UILabel!
    
    @IBOutlet weak var cumlativeGasUsedLabel: UILabel!
    
    @IBOutlet weak var fromLabel: UILabel!
    
    
    @IBOutlet weak var gasLabel: UILabel!
    
    @IBOutlet weak var gasPricelabel: UILabel!
    
    
    @IBOutlet weak var gasUsedLabel: UILabel!
    
    
    @IBOutlet weak var hashLabel: UILabel!
    
    @IBOutlet weak var inputLabel: UILabel!
    
    
    @IBOutlet weak var isErrorLabel: UILabel!
    
    @IBOutlet weak var nonceLabel: UILabel!
    
    @IBOutlet weak var timestampLabel: UILabel!
    
    @IBOutlet weak var toLabel: UILabel!
    
    @IBOutlet weak var transactionIndexlabel: UILabel!
    
    @IBOutlet weak var valueLabel: UILabel!
    
    
    @IBOutlet weak var historyNumber: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
