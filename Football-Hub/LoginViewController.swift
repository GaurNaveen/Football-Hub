//
//  LoginViewController.swift
//  Football-Hub
//
//  Created by Naveen Gaur on 6/12/18.
//  Copyright © 2018 Naveen Gaur. All rights reserved.
//

import UIKit
import GoogleSignIn
class LoginViewController: UIViewController,GIDSignInUIDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
    }
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        GIDSignIn.sharedInstance().uiDelegate = self

        view.backgroundColor = UIColor.init(netHex: 0x160E78)
        let signInButton = GIDSignInButton(frame: CGRect(x: 121, y: 534, width: 150, height: 43))
        view.addSubview(signInButton)
    }
   
    
    
    
    

}
