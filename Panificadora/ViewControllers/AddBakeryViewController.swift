//
//  AddBakeryViewController.swift
//  Panificadora
//
//  Created by ALUNO on 18/03/19.
//  Copyright © 2019 ALUNO. All rights reserved.
//

import UIKit

class AddBakeryViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var siteTF: UITextField!
    @IBOutlet weak var ownerTF: UITextField!

    @IBOutlet weak var saveBT: UIBarButtonItem!
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
    var img:UIImage?
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
    name = nameTF.text!
    owner = ownerTF.text!
    site = siteTF.text!
        
        if name != "" && owner != "" && street != "" && dataImg != nil {
             bakeryDAO.addBakery(name,owner,site,street,number,dataImg)
            self.navigationController?.popViewController(animated: true)
        } else {
            let alertController = UIAlertController(title: "Warning", message:
                "Fill the fields correctly", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
            
            self.present(alertController, animated: true, completion: nil)
        }
        
   
    }
    
    @IBAction func selectImage(_ sender: Any) {
        let imageController  = UIImagePickerController()
        imageController.delegate = self
        imageController.sourceType = .photoLibrary
        self.present(imageController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        img = info[UIImagePickerController.InfoKey.originalImage] as?  UIImage
        photoUI.image = img
         dataImg = photoUI?.image?.pngData()
        self.dismiss(animated: true, completion: nil)
    }
}
