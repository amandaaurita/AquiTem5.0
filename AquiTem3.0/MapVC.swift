//
//  MapVC.swift
//  AquiTem3.0
//
//  Created by Mateus Pacheco Roza da Cunha on 4/7/15.
//  Copyright (c) 2015 Amanda Aurita Araujo Fernandes. All rights reserved.
//

import UIKit

class MapVC: UIViewController {

    let places: [String] = ["Cardeal Leme","Frings e Kennedy","Padre Leonel Franca","Vila","Rio Data Centro","Bosque","Escola de Negócios","Estacionamento","Terminal"]
    
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
        
        navigationController?.navigationBar.topItem?.title = "Mapa"
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "refresh:",name:"load", object: nil)
        
      //  navigationController?.navigationBarHidden = true
        
      //  self.navigationItem.rightBarButtonItem = UIBarButtonItem(title:"Filtro", style:UIBarButtonItemStyle.Bordered, target:self, action:"filterTapped")
        
        DataSeller.sharedInstance.updateData()
        self.printResults()
    }

    func refresh(notification: NSNotification)
    {
        DataSeller.sharedInstance.updateData()
        self.printResults()
    }
    
    @IBAction func filterTapped(sender: UIButton) {
        var nextController = FilterVC(nibName: "FilterVC", bundle:nil)
        navigationController?.pushViewController(nextController, animated: true)
    }
    
    private func printResults()
    {
        var placesLabel: [UILabel] = [self.place1, self.place2, self.place3, self.place4, self.place5, self.place6, self.place7, self.place8, self.place9]
        var placesNumber: [Int] = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        
       
        
        for indexSeller in 0..<DataSeller.sharedInstance.filteredOnlineSellers.count
        {
            for index in 0..<self.places.count
            {
                if (DataSeller.sharedInstance.filteredOnlineSellers[indexSeller].mainPlace == self.places[index])
                {
                    placesNumber[index]++
                    break
                }
            }
        }

        for index in 0..<self.places.count
        {
            placesLabel[index].text = "\(placesNumber[index])"
        }
    }

    @IBAction func placeTapped(sender: UIButton)
    {
        var sellersInPlace:[Seller] = []
        
        for index in 0..<DataSeller.sharedInstance.filteredOnlineSellers.count
        {
            if (DataSeller.sharedInstance.filteredOnlineSellers[index].mainPlace == sender.currentTitle)
            {
                println(DataSeller.sharedInstance.filteredOnlineSellers[index].name)
                sellersInPlace.append(DataSeller.sharedInstance.filteredOnlineSellers[index])
            }
        }
        
        var nextController = SellerListVC(nibName: "SellerListVC", bundle: nil)
        nextController.sellers = sellersInPlace
        nextController.title = sender.currentTitle
        navigationController?.pushViewController(nextController, animated: true)
    }

}
