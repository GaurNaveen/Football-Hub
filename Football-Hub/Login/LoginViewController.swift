//
//  LoginViewController.swift
//  Football-Hub
//
//  Created by Naveen Gaur on 6/12/18.
//  Copyright © 2018 Naveen Gaur. All rights reserved.
//

import UIKit
import GoogleSignIn
import Firebase
class LoginViewController: UIViewController,GIDSignInUIDelegate,UITextFieldDelegate {
    // Labels on the left of Email and Password text fields.
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var ELabel: UILabel!
    @IBOutlet weak var PLabel: UILabel!
    @IBOutlet weak var forgotPassword: UIButton!
    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var signInHeaderLabel: UILabel!
    var tapGesture = UITapGestureRecognizer()
    var tapGestureForPassword = UITapGestureRecognizer()
    /// Button that user taps on the text field to clear the text field.
    var clearButton = UIButton(type: .custom)
    @IBAction func signIn(_ sender: Any) {
        print(userEmail.text ?? "none")
        //handleSignIn()
        // Move to onboarding screen. This should correctly be done on sign up though.
        performSegue(withIdentifier: "login-onboarding", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        GIDSignIn.sharedInstance().uiDelegate = self
        let signInButton = GIDSignInButton(frame: CGRect(x: 121, y: 600, width: 150, height: 43))
        view.addSubview(signInButton)
        // Set the delegate for text fields for user inputs.
        userEmail.delegate = self
        password.delegate = self
        // Add Gesture Recogniser to both Text Fields.
        hideLabelsOnTextFields()
        userEmail.addGestureRecognizer(tapGesture)
        password.addGestureRecognizer(tapGestureForPassword)
        // Change the placeholder text for the textfields.
        userEmail.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        password.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        addClearButtonToTextField()
        addClearButtonToPassword()
    }
   
    // Function allows you to retrieve user google ID andother info.
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
    }
    
    /// Function is used to add tap gesture recogniser which calls a specific funtion that makes the
    /// Lable "E" or "P" disappear while the user is typing it's credentials.
    func hideLabelsOnTextFields(){
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(textFieldTapped(_:)))
        tapGestureForPassword = UITapGestureRecognizer(target: self, action: #selector(passwordTextFieldTapped(_:)))
        tapGesture.numberOfTapsRequired = 2
        tapGestureForPassword.numberOfTapsRequired = 2
    }
    
    // Function hides the label "E" and make the P appear if it's hidden.
    @objc func textFieldTapped(_ recognizer: UITapGestureRecognizer ) {
        // Make the labels hide.
        ELabel.isHidden = true
        PLabel.isHidden = false
    }
    
    // Function hides the labl "P" and make the label "E" appear if it's hidden.
    @objc func passwordTextFieldTapped(_ recognizer: UITapGestureRecognizer){
        PLabel.isHidden = true
        ELabel.isHidden = false
    }
    
    
    /// Adds a clear button on email text field.
    private func addClearButtonToTextField(){
        let clearTap = UITapGestureRecognizer(target: self, action: #selector(clearTextField(_:)))
        // Add clear button to email and password text views.
        userEmail.rightViewMode = UITextField.ViewMode.whileEditing
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        let image = UIImage(named: "clear-button")
        imageView.image = image
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(clearTap)
        userEmail.rightView = imageView
    }
    
    // Adds a clear button to password text field.
    func addClearButtonToPassword(){
        let clearTap = UITapGestureRecognizer(target: self, action: #selector(clearTextField(_:)))
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        let image = UIImage(named: "clear-button")
        imageView.image = image
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(clearTap)
        password.rightViewMode = .whileEditing
        password.rightView = imageView
    }
    
    // Clear the text in the text field when the user taps on clear button.
    @objc private func clearTextField(_ recognizer : UITapGestureRecognizer)
    {   print("LOl")
       userEmail.text = ""
    }
    
    func handleSignIn(){
        guard let email = userEmail.text else {return}
        guard let password = password.text else {return}
        Auth.auth().signIn(withEmail: email, password: password) { user,error in
            if error == nil && user != nil {
                // Move to the Main Dashboard
            } else {
                print("Error \(String(describing: error?.localizedDescription))")
            }
            
        }
    }

}

// MARK: - Sets up the text fields.
extension LoginViewController {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
extension UIView {
    
    // To Set Auto Layout Constraints on the View.
    func anchor(top: NSLayoutYAxisAnchor,leading: NSLayoutXAxisAnchor,bottom: NSLayoutYAxisAnchor,trailing: NSLayoutXAxisAnchor,padding: UIEdgeInsets = .zero)
    {
        // Activate Auto Layout.
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        bottomAnchor.constraint(equalTo: bottom, constant: padding.bottom).isActive = true
        trailingAnchor.constraint(equalTo: trailing, constant: padding.right).isActive = true
    }
}
