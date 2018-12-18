//
//  LeagueCell.swift
//  Football-Hub
//
//  This File manages the League cell.
//  It is basically responsible for
//  displaying the League name.
//
//  Created by Naveen Gaur on 10/12/18.
//  Copyright © 2018 Naveen Gaur. All rights reserved.
//

import UIKit

class LeagueCell: UITableViewCell {

    @IBOutlet weak var leagueView: UIView!
    @IBOutlet weak var leagueName: UILabel!
    
    /// Set the label of the table view cell
    /// to the league's name.
    ///
    /// - Parameter name: take the league name as input.
    func setupCell(name : String){
        leagueName.text = name
        leagueView.layer.cornerRadius = 12
    }

}
