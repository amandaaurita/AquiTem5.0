//
//  SellerProfile.swift
//  AquiTem3.0
//
//  Created by Mateus Pacheco Roza da Cunha on 4/7/15.
//  Copyright (c) 2015 Amanda Aurita Araujo Fernandes. All rights reserved.
//

import UIKit

class SellerProfileVC: UIViewController {

    var seller:Seller?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = self.seller?.name
    }

    
    
}
