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
        
        if(self.title==nil){
            navigationController?.navigationBar.topItem?.title = "Todos"
        }
        
        navigationController?.navigationBarHidden = false
        tableView.tableFooterView = UIView(frame:CGRectZero)
        
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if(self.sellers.count != 0){
            return self.sellers.count
        }else{
            return 1
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell :  UITableViewCell? = self.tableView.dequeueReusableCellWithIdentifier("Cell") as?  UITableViewCell

        if(cell == nil){
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        }

        if(self.sellers.count != 0){
            cell!.textLabel?.text = self.sellers[indexPath.row].name
            cell!.detailTextLabel?.text = self.sellers[indexPath.row].mainPlace
            cell!.imageView?.image = self.sellers[indexPath.row].photo
            cell!.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        }else{
            cell!.detailTextLabel?.text = "Nenhum vendedor neste local!"
        }

        return cell!
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if(self.sellers.count != 0){
            var nextController = SellerProfileVC(nibName: "SellerProfileVC", bundle: nil)
            nextController.seller = self.sellers[indexPath.row]
            navigationController?.pushViewController(nextController, animated: true)
        }else{
            navigationController?.popViewControllerAnimated(true)
        }
    }
}
