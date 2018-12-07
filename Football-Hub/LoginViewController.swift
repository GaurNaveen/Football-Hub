//
//  LoginViewController.swift
//  Football-Hub
//
//  Created by Naveen Gaur on 6/12/18.
//  Copyright © 2018 Naveen Gaur. All rights reserved.
//

import UIKit
import GoogleSignIn
class LoginViewController: UIViewController,GIDSignInUIDelegate,UITextFieldDelegate {
    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        GIDSignIn.sharedInstance().uiDelegate = self
        let signInButton = GIDSignInButton(frame: CGRect(x: 121, y: 534, width: 150, height: 43))
        view.addSubview(signInButton)
        
        // Set the delegate for text fields for user inputs.
        userEmail.delegate = self
        password.delegate = self
    }
   
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
    }
}

// MARK: - Sets up the text fields.
extension LoginViewController {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
