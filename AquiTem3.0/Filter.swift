//
//  Filter.swift
//  AquiTem3.0
//
//  Created by Mateus Pacheco Roza da Cunha on 4/7/15.
//  Copyright (c) 2015 Amanda Aurita Araujo Fernandes. All rights reserved.
//

import UIKit

class Filter: NSObject {
   
    let title: [String] = ["Doce","Quentinha","Suco","Maromba"]
    var state: [String:Bool] = ["Doce":true,"Quentinha":true,"Suco":true,"Maromba":true]

    func applyFilter(sellers:[Seller]) -> [Seller]
    {
        var result:[Seller] = []
        
        for element in sellers{
            for index in 0..<self.title.count{
                if(element.category == self.title[index] && self.state[self.title[index]] == true){
                    result.append(element)
                    break
                }
            }
        }
        
        return result
    }

}
