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
    // Labels on the left of Email and Password text fields.
    @IBOutlet weak var ELabel: UILabel!
    @IBOutlet weak var PLabel: UILabel!
    
    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var password: UITextField!
    var tapGesture = UITapGestureRecognizer()
    var tapGestureForPassword = UITapGestureRecognizer()
    @IBAction func signIn(_ sender: Any) {
        print(userEmail.text ?? "none")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        GIDSignIn.sharedInstance().uiDelegate = self
        let signInButton = GIDSignInButton(frame: CGRect(x: 121, y: 534, width: 150, height: 43))
        view.addSubview(signInButton)
        
        // Set the delegate for text fields for user inputs.
        userEmail.delegate = self
        password.delegate = self
        
        // Add Gesture Recogniser to both Text Fields.
        hideLabelsOnTextFields()
        userEmail.addGestureRecognizer(tapGesture)
        password.addGestureRecognizer(tapGestureForPassword)
    }
   
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
    }
    
    
    func hideLabelsOnTextFields(){
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(textFieldTapped(_:)))
        tapGestureForPassword = UITapGestureRecognizer(target: self, action: #selector(passwordTextFieldTapped(_:)))
        tapGesture.numberOfTapsRequired = 1
        tapGestureForPassword.numberOfTapsRequired = 1
    }
    
    @objc func textFieldTapped(_ recognizer: UITapGestureRecognizer ) {
        // Make the labels hide.
        ELabel.isHidden = true
        PLabel.isHidden = false
    }
    
    @objc func passwordTextFieldTapped(_ recognizer: UITapGestureRecognizer){
        PLabel.isHidden = true
        ELabel.isHidden = false
    }
}

// MARK: - Sets up the text fields.
extension LoginViewController {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
