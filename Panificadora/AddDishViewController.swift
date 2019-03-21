//
//  AddDishViewController.swift
//  Panificadora
//
//  Created by ALUNO on 18/03/19.
//  Copyright © 2019 ALUNO. All rights reserved.
//

import UIKit

class AddDishViewController: UIViewController {
let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var caloriesTF: UITextField!
    @IBOutlet weak var priceTF: UITextField!
    var bakeryDAO:BakeryDAO = BakeryDAO()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func addDish(_ sender: Any) {
        let name:String = nameTF.text!
        let calories:Double = Double(caloriesTF.text!)!
        let price:Double = Double(priceTF.text!)!
        
        bakeryDAO.addDish(name,price, calories)
        self.navigationController?.popViewController(animated: true)
       
    }
}
