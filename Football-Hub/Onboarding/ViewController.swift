//
//  ViewController.swift
//  
//
//  Created by Naveen Gaur on 10/12/18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var welcomeText: UILabel!
    @IBOutlet weak var descriptionText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupOnboardingLabels()
    }
    
    /// Function is used to add text to the labels and set the number of lines for it.
    fileprivate func setupOnboardingLabels()
    {
        welcomeText.text = "Welcome to the Hub of Football"
        descriptionText.text = "Get all the latest scores for your favourite team from all over the world."
        descriptionText.numberOfLines = 4
    }
}
