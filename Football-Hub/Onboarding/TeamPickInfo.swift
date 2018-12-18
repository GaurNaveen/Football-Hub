//
//  TeamPickInfo.swift
//  Football-Hub
//
//  Created by Naveen Gaur on 10/12/18.
//  Copyright © 2018 Naveen Gaur. All rights reserved.
//

import UIKit

class TeamPickInfo: UIViewController {

    @IBOutlet weak var infolabelText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupInfoLabel()
    }
    
    /// Function is used to set text for label and set the number of lines for it.
    private func setupInfoLabel()
    {
        infolabelText.text = "Choose your favourite Football League and Football Team."
        infolabelText.numberOfLines = 3
    }


}
