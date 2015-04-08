//
//  MapVC.swift
//  AquiTem3.0
//
//  Created by Mateus Pacheco Roza da Cunha on 4/7/15.
//  Copyright (c) 2015 Amanda Aurita Araujo Fernandes. All rights reserved.
//

import UIKit

class MapVC: UIViewController {

    var filteredSellers:[Seller] = []
    var filter:Filter?
    let places: [String] = ["Edifício Cardeal Leme","Edifício Frings","Edifício Kennedy","Edifício Leonel Franca","Vila dos Diretórios","Rio Data Centro","Bosque","Estacionamento","Terminal"]
    
    @IBOutlet weak var place1: UILabel!
    @IBOutlet weak var place2: UILabel!
    @IBOutlet weak var place3: UILabel!
    @IBOutlet weak var place4: UILabel!
    @IBOutlet weak var place5: UILabel!
    @IBOutlet weak var place6: UILabel!
    @IBOutlet weak var place7: UILabel!
    @IBOutlet weak var place8: UILabel!
    @IBOutlet weak var place9: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(self.filter==nil)
        {self.filter = Filter()
        }
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title:"Filtro", style:UIBarButtonItemStyle.Bordered, target:self, action:"filterTapped")
        
        self.filteredSellers = self.getFilteredSellers()
        
        self.printResults()
    }

    func filterTapped(){
    
        var nextController = FilterVC(nibName: "FilterVC", bundle:nil)
        nextController.filter = self.filter
        navigationController?.pushViewController(nextController, animated: true)
    }
    
    func getFilteredSellers() -> [Seller]
    {
        var onlineSellers:[Seller] = self.getOnlineSellers()
        var result:[Seller] = self.filter!.applyFilter(onlineSellers)
        return result
    }
    
    func getOnlineSellers() -> [Seller]
    {
        var dao:DAOSellers = DAOSellers()
        var allSellers:[Seller] = dao.getAllSellers()
        var onlineSellers:[Seller] = []
        
        for index in 0...allSellers.count - 1
        {
            if (allSellers[index].online == true)
            {
                onlineSellers.append(allSellers[index])
            }
        }
        return onlineSellers
    }
    
    private func printResults()
    {
        var placesLabel: [UILabel] = [self.place1, self.place2, self.place3, self.place4, self.place5, self.place6, self.place7, self.place8, self.place9]
        var placesNumber: [Int] = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        for indexSeller in 0...self.filteredSellers.count - 1
        {
            for index in 0...self.places.count - 1
            {
                if (self.filteredSellers[indexSeller].mainPlace == self.places[index])
                {
                    placesNumber[index]++
                    break
                }
            }
        }
        
        for index in 0...self.places.count - 1
        {
            placesLabel[index].text = "\(placesNumber[index]) vendedores"
        }
    }

    @IBAction func placeTapped(sender: UIButton)
    {
        var sellersInPlace:[Seller] = []
        
        for index in 0...self.filteredSellers.count - 1
        {
            if (self.filteredSellers[index].mainPlace == sender.currentTitle)
            {
                println(self.filteredSellers[index].name)
                sellersInPlace.append(self.filteredSellers[index])
            }
        }
        
        var nextController = SellerListVC(nibName: "SellerListVC", bundle: nil)
        nextController.sellers = sellersInPlace
        nextController.title = sender.currentTitle
        navigationController?.pushViewController(nextController, animated: true)
    }

}
