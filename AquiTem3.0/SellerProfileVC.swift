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
    
   // var imageSeller: UIImage = seller.photo
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var brand: UILabel!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var mainPlace: UILabel!
    @IBOutlet weak var secondaryPlace: UILabel!
    @IBOutlet weak var descriptionSeller: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = self.seller?.name
        
        self.photo = UIImageView(image: UIImage(named:"Mayara.png"))
        self.name.text = self.seller?.name
        self.brand.text = self.seller?.brand
        self.category.text = self.seller?.category
        self.phone.text = self.seller?.phone
        self.mainPlace.text = self.seller?.mainPlace
        self.secondaryPlace.text = self.seller?.secondaryPlace
        self.descriptionSeller.text = self.seller?.description
    }

    
    
}
