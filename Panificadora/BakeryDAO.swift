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
    var bakeries:[Bakery] = []
    var dishes:[Dish] = []
    static var menu:[Dish] = []
    var adresses:[Address] = []
    var address:Address?
    var menuSet:NSSet = []
    
    
    func readBakerys() -> [Bakery] {
        let requisition = NSFetchRequest<NSFetchRequestResult>(entityName: "Bakery")
        do{
            bakeries = try context.fetch(requisition) as! [Bakery]
        }catch{
            print("Error trying load bakeries: \(error)")
        }
        return bakeries
    }

    func addBakery(_ name:String, _ owner:String, _ site:String, _ street:String, _ number:Int64, _ img:Data?){
     
        if BakeryDAO.menu.count > 0 && name != "" && owner != "" && site != "" {
              let bakeryAddress:Address = getAddress(street, number)
            
            if bakeryAddress.street != ""{
                if img != nil {
                    let bakery = NSEntityDescription.insertNewObject(forEntityName: "Bakery",
                                                                     into: context)
                    bakery.setValue(name, forKey:"name")
                    bakery.setValue(menuSet, forKey: "menu")
                    bakery.setValue(owner, forKey:"owner")
                    bakery.setValue(site, forKey:"site")
                    bakery.setValue(img, forKey: "photo")
                    bakery.setValue(bakeryAddress, forKey: "address")
                    do{
                        try context.save()
                    } catch{
                        print("Error trying save bakery: \(error)")
                    }
                }
            }
            
            
        }
       
    }
    
    func addDish(_ name:String, _ price:Double, _ calories:Double){
        let entity = NSEntityDescription.insertNewObject(forEntityName: "Dish",
                                                         into: context)
        entity.setValue(name, forKey:"name")
        entity.setValue(price, forKey:"price")
        entity.setValue(calories, forKey:"calories")
        do{
            try context.save()
        } catch{
            print("Error trying save dish: \(error)")
        }
    }
    
    func readDishes() -> [Dish] {
        let requisitionRD = NSFetchRequest<NSFetchRequestResult>(entityName: "Dish")
        do{
            dishes = try! context.fetch(requisitionRD) as! [Dish]
        }catch{
            print("Error trying load dishes: \(error)")
        }
        return dishes
    }

        func saveMenu(_ dish:Dish){
            BakeryDAO.menu.append(dish)
            menuSet = NSSet(array: BakeryDAO.menu)
        }

    func resetMenu() {
     BakeryDAO.menu.removeAll()
    }

    func deleteBakery(_ name:String){
        let requisitionRD = NSFetchRequest<NSFetchRequestResult>(entityName: "Bakery")
        requisitionRD.predicate = NSPredicate( format: "name = %@", name)
        
        do{
            let test = try! context.fetch(requisitionRD)
            let objetcToDelete = test[0] as! NSManagedObject
            context.delete(objetcToDelete)
            do {
                try context.save()
            }
            
        }catch{
            print("Error trying delete bakery: \(error)")
        }
    }

    func readAdr(){
        let requisitionRD = NSFetchRequest<NSFetchRequestResult>(entityName: "Address")
        do{
            var add = try! context.fetch(requisitionRD) as! [Address]
            for address in add as! [Address]{
                print("\(address.street) and bakery \(address.bakery)")
            }
        }catch{
            print("Error trying read address: \(error)")
        }
    }
    
    
    func addAddress(_ street:String,_ number:Int64,_ city:String,_ code:String){

        let address = NSEntityDescription.insertNewObject(forEntityName: "Address",
                                                             into: context)
        address.setValue(street, forKey: "street")
        address.setValue(number, forKey: "number")
        address.setValue(city, forKey: "city")
        address.setValue(code, forKey: "zip_code_cep")
        
        do{
            try context.save()
        } catch{
            print("Error trying save addres: \(error)")
        }
    }
    
    func getAddress(_ street:String, _ number:Int64) -> Address{
        let requisitionRD = NSFetchRequest<NSFetchRequestResult>(entityName: "Address")
        requisitionRD.fetchLimit = 1
        requisitionRD.returnsObjectsAsFaults = false
        requisitionRD.predicate = NSPredicate(format: "street = %@", street)
    
        do{
            adresses = try! context.fetch(requisitionRD) as! [Address]
            address = adresses[0]
        
        }catch{
            print("Error trying load dishes: \(error)")
        }
         return address!
    }
    
}


