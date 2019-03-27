//
//  SiteViewController.swift
//  Panificadora
//
//  Created by ALUNO on 27/03/2019.
//  Copyright © 2019 ALUNO. All rights reserved.
//

import UIKit
import WebKit

class SiteViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var webKit: WKWebView!
    
    override func loadView() {
        webKit = WKWebView()
        webKit.navigationDelegate = self
        view = webKit
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://www.hackingwithswift.com")!
        webKit.load(URLRequest(url: url))
        webKit.allowsBackForwardNavigationGestures = true
        // Do any additional setup after loading the view.
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
