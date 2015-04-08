//
//  Usuario.swift
//  AquiTem3.0
//
//  Created by Amanda Aurita Araujo Fernandes on 3/31/15.
//  Copyright (c) 2015 Amanda Aurita Araujo Fernandes. All rights reserved.
//

import Foundation
import UIKit

class User
{
    var login: String!
    var password: String!
    var photo: UIImage?
    
    
    init(login: String, password: String, photo: UIImage?)
    {
        self.login = login
        self.password = password
        self.photo = photo
    }
    
}
