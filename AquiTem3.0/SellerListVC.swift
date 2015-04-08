//
//  VendedoresTableViewController.swift
//  AquiTem3.0
//
//  Created by Mayara Coelho on 3/30/15.
//  Copyright (c) 2015 Amanda Aurita Araujo Fernandes. All rights reserved.
//

import Foundation
import UIKit


class SellerListVC: UITableViewController {
   
    var sellers: [Seller] = DataSeller.sharedInstance.onlineSellers
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView(frame:CGRectZero)
        
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.sellers.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell :  UITableViewCell? = self.tableView.dequeueReusableCellWithIdentifier("Cell") as?  UITableViewCell

        if(cell == nil){
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        }

        cell!.textLabel?.text = self.sellers[indexPath.row].name
        cell!.detailTextLabel?.text = self.sellers[indexPath.row].mainPlace
        cell!.imageView?.image = self.sellers[indexPath.row].photo
        cell!.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator

        return cell!
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        var nextController = SellerProfileVC(nibName: "SellerProfileVC", bundle: nil)
        nextController.seller = self.sellers[indexPath.row]
        navigationController?.pushViewController(nextController, animated: true)
    }
}
