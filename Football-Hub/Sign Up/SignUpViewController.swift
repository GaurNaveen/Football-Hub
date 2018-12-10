//
//  SignUpViewController.swift
//  Football-Hub
//
//  Created by Naveen Gaur on 8/12/18.
//  Copyright © 2018 Naveen Gaur. All rights reserved.
//

import UIKit
import Firebase
class SignUpViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBAction func createAccount(_ sender: Any) {
        handleSignUp()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        userName.delegate = self
        email.delegate = self
        password.delegate = self
        
    }
    
    func handleSignUp(){
        guard let username = userName.text else  {return}
        guard let email = email.text else {return}
        guard let password = password.text else {return}
        
        Auth.auth().createUser(withEmail: email, password: password) { user , error in
            
            if error == nil && user != nil {
                print("User Created")
                let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                changeRequest?.displayName = username
                changeRequest?.commitChanges { error in
                    
                    if error == nil {
                        print("User Displays Name")
                        self.dismiss(animated: false, completion: nil)
                    } else {
                        print("Error \(String(describing: error?.localizedDescription))")
                    }
                    
                }
                
            } else {
                print("Error \(String(describing: error?.localizedDescription))")
            }
        }
        
        
    }
    

}

extension SignUpViewController {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
}
