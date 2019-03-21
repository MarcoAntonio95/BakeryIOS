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
    var menu:[Dish] = [Dish()]

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
    
    func addDish(_ name:String, _ price:Double, _ calories:Double){
        let dish:Dish = Dish(context: context)
        dish.name = name
        dish.price = price
        dish.calories = calories
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
    
    func saveMenu(){
        
    }
    
    func readMenu() -> [Dish] {
        let requisitionRM : NSFetchRequest<Dish> = Dish.fetchRequest()
        do{
            let dishesSelected = try context.fetch(requisitionRM)
            menu = dishesSelected
        }catch{
            print("Error trying load menu: \(error)")
        }
        return menu
    }
    
    
    func editBakery(){
        
    }
    
    func deleteBakery(){
        
    }
    
    func addAddress(_ street:String,_ number:Int16,_ city:String,_ code:String){
        let address:Address = Address(context: context)
        address.street = street
        address.number = Int16(number)
        address.city = city
        address.zip_code_cep = code
        do{
            try context.save()
        } catch{
            print("Error trying save dish: \(error)")
        }
    }
    
}


