//
//  LoginVC.swift
//  AquiTem3.0
//
//  Created by Mateus Pacheco Roza da Cunha on 4/7/15.
//  Copyright (c) 2015 Amanda Aurita Araujo Fernandes. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.topItem?.title = "Entrar"
    }
    
    @IBAction func loginTapped(sender: UIButton) {
       
        var dao:DAOSellers = DAOSellers()
        var sellers: [Seller] = dao.getAllSellers()
        var result: Seller?
        for index in 0..<sellers.count{
            if(sellers[index].login == usernameField.text){
                result = sellers[index]
                
                self.usernameField.text = ""
                self.passwordField.text = ""
                var nextController = UpdateSellerVC(nibName: "UpdateSellerVC", bundle: nil)
                nextController.seller = result
                navigationController?.pushViewController(nextController, animated: true)
            }
        }
    }
    
    @IBAction func registerTapped(sender: UIButton) {
        
        self.usernameField.text = ""
        self.passwordField.text = ""
        var nextController = SignUpVC(nibName: "SignUpVC", bundle: nil)
        navigationController?.pushViewController(nextController, animated: true)
        
    }
    

}
