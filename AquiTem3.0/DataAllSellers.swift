//
//  DataAllSellers.swift
//  AquiTem3.0
//
//  Created by Amanda Aurita Araujo Fernandes on 4/8/15.
//  Copyright (c) 2015 Amanda Aurita Araujo Fernandes. All rights reserved.
//

import Foundation



private let data = DataAllSeller()

class DataAllSeller {
    
    var sellers:[Seller] = []
    
    private init(){
        
    }
    
    class var sharedInstance:DataAllSeller{
        return data
    }
}