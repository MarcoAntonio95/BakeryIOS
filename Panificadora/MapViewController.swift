//
//  MapViewController.swift
//  Panificadora
//
//  Created by ALUNO on 25/03/19.
//  Copyright © 2019 ALUNO. All rights reserved.
//

import UIKit
import MapKit
class MapViewController: UIViewController {
    
    @IBOutlet weak var map: MKMapView!
    var address : Address?
    var name:String?
    let lm = CLLocationManager()
    override func viewWillAppear(_ animated: Bool) {
        
        if address != nil {
            
            lm.desiredAccuracy = kCLLocationAccuracyHundredMeters
            
            lm.requestWhenInUseAuthorization()
        
            UIApplication.shared.beginIgnoringInteractionEvents()
            
            let activityIndicator = UIActivityIndicatorView(style: .gray)
            
            activityIndicator.center = self.view.center
            
            activityIndicator.hidesWhenStopped = true
            
            activityIndicator.startAnimating()
            
            self.view.addSubview(activityIndicator)
            
            let searchRequest = MKLocalSearch.Request()
            
            let street : String = String("\(address!.street!)")
            
            let number : String = String("\(address!.number)")
            
            let cep : String = String("\(address!.zip_code_cep!)")
            
            let local : String = String("\(street), \(number) - CEP:\(cep)")
            
            searchRequest.naturalLanguageQuery = local
            
            let activeSearch = MKLocalSearch(request: searchRequest)
            
            activeSearch.start { (response, error) in
                
                activityIndicator.stopAnimating()
                
                UIApplication.shared.endIgnoringInteractionEvents()
                
                if response == nil {
                    
                    print("ERRO")
                    
                }else {
                    
                    let latitude = response?.boundingRegion.center.latitude
                    
                    let longitude = response?.boundingRegion.center.longitude
                    
                    let anotation = MKPointAnnotation()
                    
                    anotation.title = self.name!
                    
                    anotation.subtitle = local
                    
                    anotation.coordinate = CLLocationCoordinate2DMake(latitude!, longitude!)
                    
                    self.map.addAnnotation(anotation)

                    let coordenada: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude!, longitude!)
                    
                    let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
                    
                    let region = MKCoordinateRegion(center: coordenada, span: span)
                    
                    self.map.setRegion(region, animated: true)
                    
                }
                
            }
            
        }
        
    }
}
