//
//  DetailViewController.swift
//  Panificadora
//
//  Created by ALUNO on 25/03/19.
//  Copyright © 2019 ALUNO. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var nameLB: UILabel!
    @IBOutlet weak var ownerLB: UILabel!
    @IBOutlet weak var siteLB: UILabel!
    @IBOutlet weak var photoIV: UIImageView!
    
    
    var bakery : Bakery!
    var address : Address!
    var name = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if name != ""{
            if bakery.name != "" {
                nameLB.text = bakery.name
            }
            
            if bakery.owner != ""{
               ownerLB.text = bakery.owner
           }
            
           if bakery.site != ""{
               siteLB.text = bakery.site
           }
            
            if bakery.address?.street != "" {
                address = bakery.address!
            }
            if bakery.photo != nil {
                photoIV.image = UIImage(data: bakery.photo!,scale: 1)
            }
            
        }

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueMap"{
            let next = segue.destination as! MapViewController
            if bakery.name != "" && bakery.address?.street != ""{
                next.address = address!
                next.name = bakery.name!
            }
        }
    }
        
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


}
