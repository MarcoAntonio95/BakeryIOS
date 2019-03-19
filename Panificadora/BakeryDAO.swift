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
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var bake:[Bakery] = [Bakery()]
    var dishs:[Dish] = [Dish()]
    
    func readBakerys() -> [Bakery] {
        let requisition : NSFetchRequest<Bakery> = Bakery.fetchRequest()
        do{
            let bakeries = try context.fetch(requisition)
            bake = bakeries
        }catch{
            print("Error trying load bakeries: \(error)")
        }
        return bake
    }
    
    func addBakery(){
        let _ = Bakery(context: context)
        do{
            try context.save()
        } catch{
            print("Error trying save bakery: \(error)")
        }
    }
    
    func addDish(){
        let di = Dish(context: context)
        do{
            try context.save()
        } catch{
            print("Error trying save dish: \(error)")
        }
    }
    
    func readDishes() -> [Dish] {
        let requisitionRD : NSFetchRequest<Dish> = Dish.fetchRequest()
        do{
            let dishes = try context.fetch(requisitionRD)
            dishs = dishes
        }catch{
            print("Error trying load dishes: \(error)")
        }
        return dishs
    }
    
    
    func editBakery(){
        
    }
    
    func deleteBakery(){
        
    }
//
//    func firstAdd(){
//        var di:Dish = Dish()
//        var ad:Address = Address()
//
//        var ds:[Dish] = [Dish()]
//
//        di.name = "AA"
//        di.price = 10.0
//        di.calories = 13.1
//
//        ad.street = "R. aa"
//        ad.city = "Curitiba"
//        ad.complement = "none"
//        ad.neighborhood = "Batel"
//        ad.number = 100
//        print("Criou ate aqui")
//        var ba:Bakery = Bakery()
//        ba.name = "Padoca"
//        ba.owner = "Marco"
//        ba.id = 1
//        di.append(dish)
//        bakery.address = addrres
//    }
    
}


