//
//  LeagueCell.swift
//  Football-Hub
//
//  Created by Naveen Gaur on 10/12/18.
//  Copyright © 2018 Naveen Gaur. All rights reserved.
//

import UIKit

class LeagueCell: UITableViewCell {

    @IBOutlet weak var leagueView: UIView!
    @IBOutlet weak var leagueName: UILabel!
    
    func setupCell(name : String){
        leagueName.text = name
        leagueView.layer.cornerRadius = 12
    }

}
