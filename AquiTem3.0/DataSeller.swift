//
//  DataAllSellers.swift
//  AquiTem3.0
//
//  Created by Amanda Aurita Araujo Fernandes on 4/8/15.
//  Copyright (c) 2015 Amanda Aurita Araujo Fernandes. All rights reserved.
//

import Foundation



private let data = DataSeller()

class DataSeller {
    
    var filter: Filter!
    
    var allSellers:[Seller]!
    var onlineSellers:[Seller]!
    var filteredOnlineSellers:[Seller]!
    
    private init(){
        self.filter = Filter()
        self.allSellers = getAllSellers()
        self.onlineSellers = getOnlineSellers()
        self.filteredOnlineSellers = getFilteredOnlineSellers()
    }
    
    func updateData()
    {
        self.allSellers = getAllSellers()
        self.onlineSellers = getOnlineSellers()
        self.filteredOnlineSellers = getFilteredOnlineSellers()
    }
    
    private func getAllSellers() -> [Seller]
    {
        var dao:DAOSellers = DAOSellers()
        return dao.getAllSellers()
    }
    
    private func getOnlineSellers() -> [Seller]
    {
        var onlineSellers:[Seller] = []
        for index in 0..<self.allSellers.count
        {
            if (self.allSellers[index].online == true)
            {
                onlineSellers.append(self.allSellers[index])
            }
        }
        return onlineSellers
    }
    
    private func getFilteredOnlineSellers() -> [Seller]
    {
        return self.filter.applyFilter(self.onlineSellers)
    }
    
    class var sharedInstance:DataSeller{
        return data
    }
}