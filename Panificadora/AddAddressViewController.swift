//
//  AddAddressViewController.swift
//  Panificadora
//
//  Created by ALUNO on 20/03/19.
//  Copyright © 2019 ALUNO. All rights reserved.
//

import UIKit

class AddAddressViewController: UIViewController {

 
    @IBOutlet weak var streetTF: UITextField!
    @IBOutlet weak var numberTF: UITextField!
    @IBOutlet weak var cityTF: UITextField!
    @IBOutlet weak var codeTF: UITextField!
    
    var owner: AddBakeryViewController!
    
    var street:String = ""
    var city:String = ""
    var code:String = ""
    var number:Int16 = 0
    var bakeryDAO:BakeryDAO = BakeryDAO()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func confirm(_ sender: Any) {
        street = streetTF.text!
        city = cityTF.text!
        code = codeTF.text!
        number = Int16(numberTF.text!)!
        owner.street = street
        owner.number = number
        owner.city = city
        owner.code = code
        
        bakeryDAO.addAddress(street, number, city, code)
        self.navigationController?.popViewController(animated: true)
    }

}
