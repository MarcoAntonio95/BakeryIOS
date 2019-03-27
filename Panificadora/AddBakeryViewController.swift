//
//  AddBakeryViewController.swift
//  Panificadora
//
//  Created by ALUNO on 18/03/19.
//  Copyright © 2019 ALUNO. All rights reserved.
//

import UIKit

class AddBakeryViewController: UIViewController {
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var siteTF: UITextField!
    @IBOutlet weak var ownerTF: UITextField!

    @IBOutlet weak var photoUI: UIImageView!
    let imagePicker = UIImagePickerController()
    
    
    var bakeryDAO:BakeryDAO = BakeryDAO()
    
    var street:String = "" {
        didSet {
            if street != "" {
            addressBT.setTitle("Edit Address", for: .normal)
            }}}
    var number:Int64 = 0
    var name:String = String()
    var owner:String = String()
    var site:String = String()
    var city:String = String()
    var code:String = String()
    var dataImg:Data?
    
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
    
    @IBAction func saveBakery(_ sender: Any) {
    dataImg = photoUI?.image?.pngData()
        
    name = nameTF.text!
    owner = ownerTF.text!
    site = siteTF.text!

    bakeryDAO.addBakery(name,owner,site,street,number)
    }
}
