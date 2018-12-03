//
//  ViewController.swift
//  Football Hub
//
//  Created by Naveen Gaur on 3/12/18.
//  Copyright © 2018 Naveen Gaur. All rights reserved.
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
    
    fileprivate func setupOnboardingLabels()
    {
        welcomeText.text = "Welcome to the Hub of Football"
        descriptionText.text = "Get all the latest scores for your favourite team from all over the world."
        descriptionText.numberOfLines = 3
    }


}

