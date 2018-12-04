//
//  TeamTableViewCell.swift
//  Football-Hub
//
//  Created by Naveen Gaur on 4/12/18.
//  Copyright © 2018 Naveen Gaur. All rights reserved.
//

import UIKit

class TeamTableViewCell: UITableViewCell {

    @IBOutlet weak var teamView: UIView!
    @IBOutlet weak var teamLogo: UIImageView!
    @IBOutlet weak var teamName: UILabel!
    
    func setupCell(logo : UIImage,teamName : String)
    {
        teamView.layer.cornerRadius = 12
        teamView.layer.borderColor = UIColor.black.cgColor
        teamView.layer.borderWidth = 0.5
        
        // Set the team logo and team name
        teamLogo.image? = logo
        self.teamName.text? = teamName
        
    }
    
}
