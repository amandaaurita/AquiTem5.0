//
//  DadosAcesso.swift
//  AquiTem3.0
//
//  Created by Amanda Aurita Araujo Fernandes on 3/25/15.
//  Copyright (c) 2015 Amanda Aurita Araujo Fernandes. All rights reserved.
//
import Foundation
import UIKit
public class DAOSellers
{
    //MARK: FUNCOES BASICAS DE MANIPULACAO DE DADOS
    
    private func getJSON(urlToRequest: String) -> NSData
    {
        return NSData(contentsOfURL: NSURL(string: urlToRequest)!)!
    }
    
    private func parseyJSON(inputData: NSData) -> Dictionary<String, String>
    {
        var result : Dictionary<String, String> = Dictionary<String, String>()
        var error: NSError?
        let parsedObject: AnyObject? = NSJSONSerialization.JSONObjectWithData(inputData, options: NSJSONReadingOptions.MutableContainers, error: &error)
        result = parsedObject as Dictionary<String, String>
        return result
    }
    
    
    //MARK:FUNCOES PARA FRONT-END
    
    func getAllSellers() -> [Seller]
    {
        
        var vendedorList: [Seller]  = []
        
        let urlPath: String = "http://vacadormiu.zz.mu/getAllSellers.php?)"
        var DictionaryDeVendedors = parseyJSON(getJSON(urlPath))
        
        var vendedorTemporario : Seller = Seller(login: "amandalinda", password:"123", photo: nil, name: "Amanda", category :"Doces", description : "coloque alguma descricao aqui",online: true)
        
        vendedorList.append(vendedorTemporario)
        
        for keys in DictionaryDeVendedors
        {
            
            var vendedorTemporario : Seller = Seller(login: DictionaryDeVendedors["login"]!, password: DictionaryDeVendedors["password"]!, photo: nil, name: DictionaryDeVendedors["name"]!, category :DictionaryDeVendedors["category"]!, description : DictionaryDeVendedors["description"]!,online: true)
            
            if(DictionaryDeVendedors["online"] == "sim")
            {
                vendedorTemporario.online = true;
            }
            else
            {
                vendedorTemporario.online = false;
            }
            
            vendedorList.append(vendedorTemporario)
            println(vendedorList)
        }
        
        
        return vendedorList
        
        //return self.fakeSellers()
    }
    
    func setSeller(vendedor:Seller) -> Bool
    {
<<<<<<< HEAD
        var login = vendedor.login
        var password = vendedor.password
        var name = vendedor.name
        var category = vendedor.category
        var description = vendedor.description
        var brand = vendedor.brand
        var phone = vendedor.phone
        var mainplace = vendedor.mainPlace
        var secundaryplace = vendedor.secondaryPlace
        var online = vendedor.online
        
        var onlineString : String
        
        if(online == true)
        {
            onlineString = "sim"
        }else
        {
            onlineString = "nao"
        }
        
        
        let url = NSURL(string: "http://vacadormiu.zz.mu/setSeller.php?login=\(login)&password=\(password)&name=\(name)&category=\(category)&description=\(description)&brand=\(brand)&phone=\(phone)&mainplace=\(mainplace)&secundaryplace=\(secundaryplace)&online=\(onlineString)")
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!)
            {
                (data, response, error) in
                println(NSString(data: data, encoding: NSUTF8StringEncoding))
        }
        
        task.resume()
        
        return false;
    }
    
    //TODO: criar updateSeller.php de modificar vendedor de acordo com os campos citados no metodo - ok
    func updateSeller(login:String, nomeDoCampoQueSeraMudado:String, valorDoCampoQueSeraMudado:String) -> Bool
    {
        
        let url = NSURL(string: "http://cavadormiu.zz.mu/updateSeller.php?login=\(login)&nomeDoCampoQueSeraMudado=\(nomeDoCampoQueSeraMudado)&valorDoCampoQueSeraMudado=\(valorDoCampoQueSeraMudado)")
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!)
            {
                (data, response, error) in
                println(NSString(data: data, encoding: NSUTF8StringEncoding))
        }
        
        task.resume()
        
        return false;
        
    }
=======
        return true
    }
    
//    func verifyLogin(username:String, password:String) -> Bool
//    {
//        var sellers = getAllSellers()
//        for index in 0..<sellers.count{
//            if(sellers[index].name == username){
//                return true
//            }else{
//                return false
//        }
//    }
//    
//    func getSeller(username:String) ->Seller
//    {
//        var sellers: [Seller] = self.getAllSellers()
//        var result: Seller?
//        for index in 0..<sellers.count{
//            if(sellers[index].name == username){
//                result = sellers[index]
//            }
//        }
//        return result!
//    }
    

>>>>>>> origin/master
    //MARK: FUNCAO VENDEDORES FALSOS
    
    func fakeSellers() -> [Seller]
    {
        
        var Mateus:Seller = Seller(login: "Mateus", password: "Mateus", photo:UIImage(named:"Mateus.png")!, name: "Mateus", category: "Quentinha", description: "Vendo quentinhas baratas, apenas 7 reais", online: true)
        Mateus.brand = "Marmitas Boladas"
        Mateus.phone = "99416-8032"
<<<<<<< HEAD
        Mateus.mainPlace = "Ed. Cardeal Leme"
=======
        Mateus.mainPlace = "Cardeal Leme"
>>>>>>> origin/master
        Mateus.secondaryPlace = "Sala 252"
        
        var Amanda:Seller = Seller(login: "Amanda", password: "Amanda", photo:UIImage(named:"Amanda.png")!, name: "Amanda", category: "Doce", description: "Os únicos docinhos reais do aplicativo", online: true)
        Amanda.brand = "Tutti Doces"
        Amanda.phone = "99416-8032"
<<<<<<< HEAD
        Amanda.mainPlace = "Ed. Frings"
=======
        Amanda.mainPlace = "Frings e Kennedy"
>>>>>>> origin/master
        Amanda.secondaryPlace = "Sala 103"
        
        
        var Mayara:Seller = Seller(login: "Mayara", password: "Mayara", photo:UIImage(named:"Mayara.png")!, name: "Mayara", category: "Maromba", description: "Variedade de comida, tudo com Whey!", online: true)
        Mayara.brand = "Maromba Food"
        Mayara.phone = "99416-8032"
<<<<<<< HEAD
        Mayara.mainPlace = "Ed. Frings"
=======
        Mayara.mainPlace = "Frings e Kennedy"
>>>>>>> origin/master
        Mayara.secondaryPlace = "Bandejão"
        
        
        var Emanoel:Seller = Seller(login: "Emanoel", password: "Emanoel", photo:UIImage(named:"Emanoel.png")!, name: "Emanoel", category: "Suco", description: "Sucos mofados por apenas 2,50", online: true)
        Emanoel.brand = "Sucos Mofados"
        Emanoel.phone = "99416-8032"
<<<<<<< HEAD
        Emanoel.mainPlace = "Ed. Kennedy"
=======
        Emanoel.mainPlace = "Vila"
>>>>>>> origin/master
        Emanoel.secondaryPlace = "Pilotis"
        
        
        
        return [Mateus, Amanda, Mayara, Emanoel]
    }
    
   
    
    
    
}