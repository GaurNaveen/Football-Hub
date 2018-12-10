//
//  WelcomeViewController.swift
//  Football-Hub
//
//  Created by Naveen Gaur on 9/12/18.
//  Copyright © 2018 Naveen Gaur. All rights reserved.
//

import UIKit
import Firebase
class WelcomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        if let user = Auth.auth().currentUser {
            performSegue(withIdentifier: "toOnboardingScreen", sender: self)
        }
    }

}
