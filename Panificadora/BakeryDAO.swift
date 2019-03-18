//
//  BakeryDAO.swift
//  Panificadora
//
//  Created by ALUNO on 15/03/19.
//  Copyright © 2019 ALUNO. All rights reserved.
//
import UIKit
import Foundation
import CoreData

class BakeryDAO {
    let bakery:Bakery = Bakery()
    let bakeries:[Bakery] = [Bakery()]
    let dish:Dish = Dish()
    let addrres:Address = Address()
    let dishes:[Dish] = [Dish()]
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    
    
    func readBakerys() -> [Bakery] {
        let requisition : NSFetchRequest<Bakery> = Bakery.fetchRequest()
            do{
                let bakeries = try context.fetch(requisition)
            }catch{
                print("Error trying load bakeries: \(error)")
            }
        return bakeries
    }
    
    func addBakery(){
        let bakery = Bakery(context: context)
            do{
                try context.save()
            } catch{
                print("Error trying save bakery: \(error)")
    }
    }
        func addDish(){
            
        }
        
        func editBakery(){
            
        }
        
        func deleteBakery(){
            
        }
        
        func firstAdd(){
            
        }
}





//override func viewDidLoad() {
//    super.viewDidLoad()
//    // Do any additional setup after loading the view, typically from a nib.
//    
//    //create
//    let pessoa = Pessoa(context: contexto)
//    pessoa.nome = "Craudéte de Souza Borja"
//    
//    do{
//        try contexto.save()
//    } catch{
//        print("Erro ao salvar o contexto: \(error)")
//        
//        //read
//        //            var pessoas:[Pessoa]!
//        //            let requisicao : NSFetchRequest<Pessoa> = Pessoa.fetchRequest()
//        //
//        //            do{
//        //           pessoas = try contexto.fetch(requisicao)
//        //                print(pessoas)
//        //            } catch{
//        //            print("Erro ao ler o contexto: \(error)")
//        //            }
//        //
//        //
//        //read with filters
//        //https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/Predicates/Articles/pSyntax.html
//        var pessoas2:[Pessoa]!
//        let requisicao2 : NSFetchRequest<Pessoa> = Pessoa.fetchRequest()
//        requisicao2.predicate = NSPredicate(format: "nome LIKE 'crau*'")
//        do{
//            pessoas2 = try contexto.fetch(requisicao2)
//            print(pessoas2)
//        } catch{
//            print("Erro ao ler o contexto: \(error)")
//        }
//    }
//    
//}

