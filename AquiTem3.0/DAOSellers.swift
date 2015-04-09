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
        return self.fakeSellers()
    }
    
    func setSeller(Seller) -> Bool
    {
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
    

    //MARK: FUNCAO VENDEDORES FALSOS
    
    func fakeSellers() -> [Seller]
    {
        
        var Mateus:Seller = Seller(login: "Mateus", password: "Mateus", photo:UIImage(named:"Mateus.png")!, name: "Mateus", category: "Quentinha", description: "Vendo quentinhas baratas, apenas 7 reais", online: true)
        Mateus.brand = "Marmitas Boladas"
        Mateus.phone = "99416-8032"
        Mateus.mainPlace = "Cardeal Leme"
        Mateus.secondaryPlace = "Sala 252"
    
        var Amanda:Seller = Seller(login: "Amanda", password: "Amanda", photo:UIImage(named:"Amanda.png")!, name: "Amanda", category: "Doce", description: "Os únicos docinhos reais do aplicativo", online: true)
        Amanda.brand = "Tutti Doces"
        Amanda.phone = "99416-8032"
        Amanda.mainPlace = "Frings e Kennedy"
        Amanda.secondaryPlace = "Sala 103"
        
        
        var Mayara:Seller = Seller(login: "Mayara", password: "Mayara", photo:UIImage(named:"Mayara.png")!, name: "Mayara", category: "Maromba", description: "Variedade de comida, tudo com Whey!", online: true)
        Mayara.brand = "Maromba Food"
        Mayara.phone = "99416-8032"
        Mayara.mainPlace = "Frings e Kennedy"
        Mayara.secondaryPlace = "Bandejão"
        
        
        var Emanoel:Seller = Seller(login: "Emanoel", password: "Emanoel", photo:UIImage(named:"Emanoel.png")!, name: "Emanoel", category: "Suco", description: "Sucos mofados por apenas 2,50", online: true)
        Emanoel.brand = "Sucos Mofados"
        Emanoel.phone = "99416-8032"
        Emanoel.mainPlace = "Vila"
        Emanoel.secondaryPlace = "Pilotis"
        
        
        
        return [Mateus, Amanda, Mayara, Emanoel]
    }

    
    //MARK: FUNCOES PARA APAGAR
    
//    func listaVendedores()->[Vendedor]
//    {
//        let urlPath: String = "http://cariocando.zz.vc/aquiTemArquivos/BuscaDadosVendedor.php?)"
//
//        var vendedorList: [Vendedor]  = []
//        var dictionaryDeVendedors = parseyJSON(getJSON(urlPath))
//        var vendedorTemporario: Vendedor
//        
//        for keys in dictionaryDeVendedors
//        {
//            vendedorTemporario = Vendedor(login: dictionaryDeVendedors["login"]!, senha: dictionaryDeVendedors["senha"]!, foto: nil,nome: dictionaryDeVendedors["nome"]!, categoria: dictionaryDeVendedors["categoria"]!, estaAtivo: true)
//            
//            
//            vendedorList.append(vendedorTemporario)
//        }
//        
//        
//        return vendedorList
//    }
//    
//    func buscaVendedoresAtivos()->[Vendedor]
//    {
//        
//        var vendedorList: [Vendedor] = []
//        
//        
//        var vendedorTemporario : Vendedor = Vendedor(login: "amandalinda", senha:"123", foto: nil, nome: "Amanda", categoria: "Doces", estaAtivo: true)
//        vendedorTemporario.localizacao1 = "Leme"
//        vendedorList.append(vendedorTemporario)
//        
//        vendedorTemporario = Vendedor(login: "gabriellinda", senha:"123456", foto: nil,nome: "Gabriel", categoria: "Sucos", estaAtivo: true)
//        vendedorTemporario.localizacao1 = "Vila"
//        vendedorList.append(vendedorTemporario)
//        
//        
//        vendedorTemporario = Vendedor(login: "rayssalinda", senha:"3452", foto: nil,nome: "Rayssa", categoria: "Quentinhas", estaAtivo: true)
//        vendedorTemporario.localizacao1 = "Vila"
//        vendedorList.append(vendedorTemporario)
//        
//        
//        vendedorTemporario = Vendedor(login: "jujuba", senha:"135", foto: nil,nome: "Julinana", categoria: "Doces", estaAtivo: true)
//        vendedorTemporario.localizacao1 = "Frings"
//        vendedorList.append(vendedorTemporario)
//        
//        
//        vendedorTemporario = Vendedor(login: "Emanuelinda", senha:"6543", foto: nil,nome: "Emanuel", categoria: "MarombaFood", estaAtivo: true)
//        vendedorTemporario.localizacao1 = "BEPiD"
//        vendedorList.append(vendedorTemporario)
//        
//        //TODO:Criar php com o nome BuscaVendedoresAtivos para verificar coluna de estaAtivo ou nao e retornar apenas os usuarios ativos
////////        let urlPath: String = "http://cariocando.zz.vc/aquiTemArquivos/BuscaVendedoresAtivos.php?)"
////////        var dictionaryDeVendedors = parseyJSON(getJSON(urlPath))
////////        
////////        for keys in dictionaryDeVendedors
////////        {
////////            vendedorTemporario = Vendedor(login: dictionaryDeVendedors["login"]!, senha: dictionaryDeVendedors["senha"]!, foto: nil,nome: dictionaryDeVendedors["nome"]!, categoria: dictionaryDeVendedors["categoria"]!, estaAtivo: true)
////////            
////////            vendedorTemporario.localizacao1 = dictionaryDeVendedors["localizacao1"]
////////            vendedorList.append(vendedorTemporario)
////////        }
////////        
//        
//        
//        return vendedorList
//
//        
//        
//    }
//    
//    func verificaLogin(login: String, senha: String)-> Usuario?
//    {
//        //TODO: Implementar busca no banco de dados. Se senha e login estiverem corretos, pegar os dados no banco e criar uma instancia de "Vendedor" para ser o retorno da funcao. Se login e senha estiverem errados, retornar "nil"
//        var retorno: Usuario? = nil
//        
//        if (login == "amandalinda" && senha == "123") {
//            retorno = Vendedor(login: "amandalinda", senha:"123", foto: nil, nome: "Amanda", categoria: "Doces", estaAtivo: true)
//        } else if (login == "gabriellinda" && senha == "123456")  {
//            retorno = Vendedor(login: "gabriellinda", senha:"123456", foto: nil,nome: "Gabriel", categoria: "Sucos", estaAtivo: true)
//        } else if (login == "rayssalinda" && senha == "3452")  {
//            retorno = Vendedor(login: "rayssalinda", senha:"3452", foto: nil,nome: "Rayssa", categoria: "Quentinhas", estaAtivo: true)
//        } else if (login == "jujuva" && senha == "135")  {
//            retorno = Vendedor(login: "jujuba", senha:"135", foto: nil,nome: "Julinana", categoria: "Doces", estaAtivo: true)
//        } else if (login == "Emanuelinda" && senha == "6543")  {
//            retorno = Vendedor(login: "Emanuelinda", senha:"6543", foto: nil,nome: "Emanuel", categoria: "MarombaFood", estaAtivo: true)
//        }
//        return retorno
//    }
//    
//    func cadastraUsuario(login: String, senha: String, nome: String, categoria: String)-> Usuario?
//    {
//        var retorno: Vendedor = Vendedor(login:login, senha:senha,foto: nil, nome:nome, categoria:categoria, estaAtivo: false)
//        return retorno
//        
//    }
//    
//    func buscaVendedorEspecifico(idVendedor: Int, nome: String, marca: String)->Vendedor?
//    {
//        let urlPath: String = "http://cariocando.zz.vc/aquiTemArquivos/BuscaDadosVendedor.php?id=\(idVendedor))"
//        
//        var vendedorTemporario: Vendedor
//        
//        var dictionaryVendedor =  parseyJSON(getJSON(urlPath))
//        
//        for keys in dictionaryVendedor
//        {
//            
//            vendedorTemporario = Vendedor(login: dictionaryVendedor["login"]!, senha: dictionaryVendedor["senha"]!, foto: nil,nome: dictionaryVendedor["nome"]!, categoria: dictionaryVendedor["categoria"]!,estaAtivo:true )
//            
//            if((vendedorTemporario.nome == nome) ||  (vendedorTemporario.marca == marca))
//            {
//               return vendedorTemporario
//            }
//            
//        }
//        
//        return nil   //retorna nil caso o vendedor especifico nao seja encontrado
//        
//    }
//    
//    func criaVendedor(nome:String,marca:String, categoria: String, descricao:String,localizacao:String,localizacao2:String,telefone:String)->[Vendedor]
//    {
//        //TODO: 1) Colocar o item categoria nessa url. Categoria é um item obrigatorio para se criar um vendedor.  2) Pensar numa maneira melhor de inicializar o login e a senha neste cazo
//        
//        let url = NSURL(string: "http://cariocando.zz.vc/aquiTemArquivos/InsereDadosVendedor.php?nome=\(nome)&marca=\(marca)&descricao=\(descricao)&localizacao=\(localizacao)&localizacao2=\(localizacao2)&telefone=\(telefone)")
//        
//        let task = NSURLSession.sharedSession().dataTaskWithURL(url!)
//            {
//                (data, response, error) in
//                println(NSString(data: data, encoding: NSUTF8StringEncoding))
//        }
//
//        task.resume()
//        
//        
//        var vendedorList: [Vendedor] = listaVendedores()
//        var vendedorSendoCriado: Vendedor = Vendedor(login:"", senha:"", foto: nil, nome: nome, categoria: categoria, estaAtivo: false)
//        vendedorSendoCriado.descricao = descricao
//        vendedorSendoCriado.localizacao1 = localizacao
//        vendedorSendoCriado.localizacao2 = localizacao2
//        vendedorSendoCriado.marca = marca
//        vendedorSendoCriado.telefone = telefone
//        
//        vendedorList.append(vendedorSendoCriado)
//        
//        return vendedorList
//        
//       
//
//   }
//    
//    func buscaLocalizacoes()-> [String?]
//    {
//        
//       
//        var vendedorList: [Vendedor] = buscaVendedoresAtivos()
//        var posicoes: [String?] = []
//        
//        for i in 0...vendedorList.count
//        {
//            posicoes.append(vendedorList[i].localizacao1)
//        }
//        
//        return posicoes
//
//        
//    }
//    
//    func atualizaVendedor()
//    {
//        
//    }
//
//    
//    func criaProduto(vendedor: Vendedor, idVendedor: String, nome: String , categoria: String, tipo: String, preco: Double)-> Produto
//    {
//        let url = NSURL(string: "http://cariocando.zz.vc/aquiTemArquivos/InsereDadosProdutos.php?idvendedor=\(idVendedor)&produto=\(nome)&categoria=\(categoria)&tipo=\(tipo)&preco=\(preco)")
//        
//        let task = NSURLSession.sharedSession().dataTaskWithURL(url!)
//            {
//                (data, response, error) in
//                println(NSString(data: data, encoding: NSUTF8StringEncoding))
//        }
//        
//        task.resume()
//        
//        var produto:Produto = Produto(vendedor: vendedor, nome: nome, categoria: categoria, tipo: tipo, preco: preco)
//        
//        produto.nome = nome
//        produto.categoria = categoria
//        produto.tipo = tipo
//        produto.preço = preco
//        
//        return produto
//        
//        
//        
//    }
//    
//    func listaProdutos()->[Produto]
//    {
//        
//        let urlPath: String = "http://cariocando.zz.vc/aquiTemArquivos/BuscaDadosProdutos.php?"
//        let resultadoDaBuscaProdutos = parseyJSON(getJSON(urlPath))
//        
//        var produtoList: [Produto]  = []
//        var dictionaryDeProdutos = parseyJSON(getJSON(urlPath))
//        var produtoTemporario: Produto
//        
//        for keys in dictionaryDeProdutos
//        {
//       //     produtoTemporario = Produto(vendedor: dictionaryDeProdutos["idVendedor"] , nome: dictionaryDeProdutos["nome"]!, categoria: dictionaryDeProdutos["categoria"]!, tipo: dictionaryDeProdutos["tipo"]!)
//            
//            
//           // produtoList.append(produtoTemporario)
//        }
//        return produtoList
//        
//    }
    
    
 


}

