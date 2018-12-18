//
//  TeamCell.swift
//  Football-Hub
//
//  This File manages the cells
//  that are expanded when the user
//  clicks on a league while choosing his/her
//  fav team.
//
//  Created by Naveen Gaur on 10/12/18.
//  Copyright © 2018 Naveen Gaur. All rights reserved.
//

import UIKit

class TeamCell: UITableViewCell {
    @IBOutlet weak var teamLogo: UIImageView!
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var teamView: UIView!
    
     func setupCell(logo : UIImage,teamName : String) {
        /// Sets up the background for the cell.
        teamView.layer.cornerRadius = 12
        teamView.layer.borderColor = UIColor.black.cgColor
        teamView.layer.borderWidth = 0.5
        
        // set the team logo and name on the cell.
        teamLogo.image = logo
        self.teamName.text = teamName
    }

}
