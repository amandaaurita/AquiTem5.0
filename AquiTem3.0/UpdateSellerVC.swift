//
//  VendedorAdm.swift
//  AquiTem3.0
//
//  Created by Amanda Aurita Araujo Fernandes on 3/26/15.
//  Copyright (c) 2015 Amanda Aurita Araujo Fernandes. All rights reserved.
//

import UIKit
import Foundation

class UpdateSellerVC: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var fotoPerfil: UIImageView!
    
    @IBOutlet weak var localPicker: UIPickerView!
    
    @IBOutlet weak var secundaryLocal: UITextField!
    
    @IBOutlet weak var statusSwitch: UISwitch!
    
    @IBOutlet weak var brandField: UITextField!
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var telephoneField: UITextField!
    
    @IBOutlet weak var categoryField: UITextField!
    
    @IBOutlet weak var descriptionField: UITextView!
    
    
    //vetor com nomes dos locais que ficarão no picker view
    var local = ["Bandejão","Biblioteca","Campo de Futebol","CCE","CouveFlor","Edificio Garagem","Edificio Kennedy","Edificio TecGraf"," Estacionamento","Frings","Genesis","Ginasio","Gourmet","IAG","Igreja","IMA"," ITUC","LAB SEM","LABGrad","Leme","Leonel Franca","LEV","RDC","Salas de arte","SOLAR","SPA","Tendas de arte","Terminal PUC-RIO","Vila"]
    
    
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //bloco de codigo para deixar a imagem do perfil redonda
        fotoPerfil.layer.borderWidth=1.0
        fotoPerfil.layer.masksToBounds = false
        fotoPerfil.layer.borderColor = UIColor.blackColor().CGColor
        fotoPerfil.layer.cornerRadius = 13
        fotoPerfil.layer.cornerRadius = fotoPerfil.frame.size.height/2
        fotoPerfil.clipsToBounds = true
        
        
    }
    
    @IBAction func saveInformation(sender: AnyObject) {
        
        var currentSeller: Seller
        
        var brandNameSeller = brandField.text as String
        var categorySeller = categoryField.text as String
        var descriptionProducts = descriptionField.text as String
        //   currentSeller.mainPlace =   pickerView(localPicker, self.numberOfComponentsInPickerView(localPicker),1)
        var nameSeller = nameField.text as String
        var status: Bool = self.setStatus(statusSwitch)
        
        currentSeller = Seller(login: "", password: "", photo: fotoPerfil.image!, name: nameSeller, category: categorySeller, description: descriptionProducts, online: status)
        DataAllSeller.sharedInstance.sellers.append(currentSeller)
        
        
        
        
        
    }
    
    func setStatus(componentswitch: UISwitch)->Bool{
        if(componentswitch.on)
        {
            return true
        }
        else
        {
            return false
        }
    }
    
    
    
    func numberOfComponentsInPickerView(bigPicker: UIPickerView) -> Int{
        
        return 1
        
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return local.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int,
        forComponent component: Int) -> String!
    {
        return local[row]
    }
    
}