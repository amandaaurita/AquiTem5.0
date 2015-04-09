//
//  FilterVC.swift
//  AquiTem3.0
//
//  Created by Mateus Pacheco Roza da Cunha on 4/7/15.
//  Copyright (c) 2015 Amanda Aurita Araujo Fernandes. All rights reserved.
//

import UIKit



class FilterVC: UIViewController {

    @IBOutlet weak var category1: UISwitch!
    @IBOutlet weak var category2: UISwitch!
    @IBOutlet weak var category3: UISwitch!
    @IBOutlet weak var category4: UISwitch!
 
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Filtro"
        
        self.navigationController?.navigationBarHidden = false
        
        self.updateSwitches(DataSeller.sharedInstance.filter)
    }
    
    func recordFilter()
    {
        var filter:Filter = Filter()
        
        var switchs: [UISwitch] = [self.category1, self.category2, self.category3, self.category4]
        for index in 0..<DataSeller.sharedInstance.filter.state.count{
            DataSeller.sharedInstance.filter.state[DataSeller.sharedInstance.filter.title[index]] = switchs[index].on
        }
    }
        
    func updateSwitches(filter:Filter)
    {
        var switchs: [UISwitch] = [self.category1, self.category2, self.category3, self.category4]
        for index in 0..<DataSeller.sharedInstance.filter.state.count{
            switchs[index].on = DataSeller.sharedInstance.filter.state[DataSeller.sharedInstance.filter.title[index]]!
        }
    }
    @IBAction func applyFilterTapped(sender: UIButton) {

        self.recordFilter()
        NSNotificationCenter.defaultCenter().postNotificationName("load", object: nil)
        navigationController?.popViewControllerAnimated(true)
    }
}
