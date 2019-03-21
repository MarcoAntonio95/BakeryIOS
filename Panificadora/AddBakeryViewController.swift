//
//  AddBakeryViewController.swift
//  Panificadora
//
//  Created by ALUNO on 18/03/19.
//  Copyright © 2019 ALUNO. All rights reserved.
//

import UIKit

class AddBakeryViewController: UIViewController {
    var bakeryDAO:BakeryDAO = BakeryDAO()
    var street:String = "" {
        didSet {
            if street != "" {
            addressBT.setTitle(street, for: .normal)
            }
        }
    }
    var city:String = ""
    var number:Int16 = 0
    var code:String = ""
    
    @IBOutlet weak var addressBT: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueAddress"{
            let next = segue.destination as! AddAddressViewController
            next.owner = self
        }
    
    }
}
