//
//  FilterVC.swift
//  AquiTem3.0
//
//  Created by Mateus Pacheco Roza da Cunha on 4/7/15.
//  Copyright (c) 2015 Amanda Aurita Araujo Fernandes. All rights reserved.
//

import UIKit



class FilterVC: UIViewController {

    var filter:Filter?
    @IBOutlet weak var category1: UISwitch!
    @IBOutlet weak var category2: UISwitch!
    @IBOutlet weak var category3: UISwitch!
    @IBOutlet weak var category4: UISwitch!
 
    override func viewDidLoad() {
        super.viewDidLoad()

        self.updateSwitches(self.filter!)
    }
    
    func recordFilter() -> Filter
    {
        var filter:Filter = Filter()
        
        var switchs: [UISwitch] = [self.category1, self.category2, self.category3, self.category4]
        for index in 0...filter.state.count - 1{
            filter.state[filter.title[index]] = switchs[index].on
        }
        return filter
    }
        
    func updateSwitches(filter:Filter)
    {
        var switchs: [UISwitch] = [self.category1, self.category2, self.category3, self.category4]
        for index in 0...filter.state.count - 1{
            switchs[index].on = filter.state[filter.title[index]]!
        }
    }
    @IBAction func applyFilterTapped(sender: UIButton) {
        self.filter = recordFilter()
        var nextController = MapVC(nibName: "MapVC", bundle:nil)
        nextController.filter = self.filter
        navigationController?.pushViewController(nextController, animated: true)
    }
}
