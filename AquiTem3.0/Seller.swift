//
//  Vendedor.swift
//  AquiTem3.0
//
//  Created by Amanda Aurita Araujo Fernandes on 3/25/15.
//  Copyright (c) 2015 Amanda Aurita Araujo Fernandes. All rights reserved.
//

import Foundation
import UIKit

class Seller: User
{
    var name: String!
    var brand: String?
    var category: String!
    var phone: String?
    var mainPlace: String?
    var secondaryPlace: String?
    var description: String!
    var online: Bool?

    
    init(login: String, password: String, photo: UIImage, name : String, category : String, description:String, online: Bool)
    {
        super.init(login: login, password: password, photo: photo)
        self.name = name
        self.category = category
        self.description = description
        self.online = online

    }
}
