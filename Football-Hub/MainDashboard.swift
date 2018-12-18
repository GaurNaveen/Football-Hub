//
//  MainDashboard.swift
//  Football-Hub
//
//  Created by Naveen Gaur on 11/12/18.
//  Copyright © 2018 Naveen Gaur. All rights reserved.
//

import UIKit

class MainDashboard: UIViewController {

    @IBOutlet weak var navigationBar: UINavigationBar!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupNavigationBarTitle()
    }
    
    func setupNavigationBarTitle() {
        navigationBar.topItem?.title = "Manchester United"
    }
    
}
