//
//  LeagueTableViewCell.swift
//  Football-Hub
//
//  Created by Naveen Gaur on 4/12/18.
//  Copyright © 2018 Naveen Gaur. All rights reserved.
//

import UIKit

class LeagueTableViewCell: UITableViewCell {

    @IBOutlet weak var leagueView: UIView!
    @IBOutlet weak var leagueName: UILabel!
    
    func  setupCell(name : String){
        
        leagueView.layer.cornerRadius = 12
        leagueName.text = name
    }

}
