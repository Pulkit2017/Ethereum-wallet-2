//
//  Wallet+TableView.swift
//  Ethereum wallet
//
//  Created by Crystal on 20170810//.
//  Copyright © 2017 CrystalTravel. All rights reserved.
//

import Foundation
import UIKit

extension WalletViewController
{
    
    //MARK: Uitableview methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(walletModel.count == 0)
        {
            return 1
        }
        return walletModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(walletModel.count == 0)
        {
            let cellIdentifier = "UITableViewCell"
            let cell = UITableViewCell.init()
            
            cell.textLabel?.text = "No transactions"
               return cell;
            
        }
        let cellIdentifier = "WalletHistoryTableViewCell"
        var cell : WalletHistoryTableViewCell!
        cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)! as! WalletHistoryTableViewCell
        
        cell.blockHashLabel.text? = walletModel[indexPath.row].blockHash!
        cell.blockNumberLabel.text? = walletModel[indexPath.row].blockNumber!
        cell.confirmationLabel.text? = walletModel[indexPath.row].confirmations!
       
        cell.cumlativeGasUsedLabel.text? = walletModel[indexPath.row].cumulativeGasUsed!
        cell.fromLabel.text? = walletModel[indexPath.row].from!
        cell.gasLabel.text? = walletModel[indexPath.row].gas!
        cell.gasPricelabel.text? = walletModel[indexPath.row].gasPrice!
        cell.gasUsedLabel.text? = walletModel[indexPath.row].gasUsed!
        cell.hashLabel.text? = walletModel[indexPath.row].hashCode!
        cell.inputLabel.text? = walletModel[indexPath.row].input!
        cell.isErrorLabel.text? = walletModel[indexPath.row].isError!
        cell.nonceLabel.text? = walletModel[indexPath.row].nonce!
        cell.timestampLabel.text? = walletModel[indexPath.row].timeStamp!
        cell.toLabel.text? = walletModel[indexPath.row].to!
        cell.transactionIndexlabel.text? = walletModel[indexPath.row].transactionIndex!
        cell.valueLabel.text? = walletModel[indexPath.row].value!
        cell.historyNumber.text? = "Transaction \(indexPath.row)"
        
        return cell;
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(walletModel.count == 0)
        {
            return 30
        }
        return 800
    }
    
    
    
    
    
}
