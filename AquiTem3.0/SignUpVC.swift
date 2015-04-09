//
//  SignUpVC.swift
//  AquiTem3.0
//
//  Created by Mateus Pacheco Roza da Cunha on 4/7/15.
//  Copyright (c) 2015 Amanda Aurita Araujo Fernandes. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var passwordConfirmField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Cadastro"
    }

    @IBAction func registerTapped(sender: UIButton) {
        
        self.usernameField.text = ""
        self.passwordField.text = ""
        self.passwordConfirmField.text = ""
        var nextController = UpdateSellerVC(nibName: "UpdateSellerVC", bundle: nil)
        navigationController?.pushViewController(nextController, animated: true)
        
    }
}
