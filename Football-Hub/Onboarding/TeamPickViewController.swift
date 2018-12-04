//
//  TeamPickViewController.swift
//  Football-Hub
//
//  Created by Naveen Gaur on 3/12/18.
//  Copyright © 2018 Naveen Gaur. All rights reserved.
//

import UIKit

struct league {
    var opened = Bool()
    var leagueName = String()
    var teamsInLeague = [team]()
}

struct team {
    var teamLogo = UIImage()
    var teamName = String()
}

class TeamPickViewController: UITableViewController {
    
    var tableViewData = [league]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupTableViewData()
    }
    
    /// Function is used to create data to display in the Table View.
    /// Gives User the oppuurtunity to choose his/her favourite team.
    func setupTableViewData()
    {
        tableViewData = [league(opened: false, leagueName: "England - Premier League", teamsInLeague: [team(teamLogo: #imageLiteral(resourceName: "Manchester-United"), teamName: "Manchester United"),team(teamLogo: #imageLiteral(resourceName: "Arsenal"), teamName: "Arsenal F.C."),team(teamLogo: #imageLiteral(resourceName: "Liverpool"), teamName: "Liverpool F.C."),team(teamLogo: #imageLiteral(resourceName: "Chelsea"), teamName: "Chelsea F.C.")] )]
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // For the Main Heading we use a different cell.
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "headerCell") else {return UITableViewCell()}
            return cell
        }
        
        
        if indexPath.row == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "leagueCell") as? LeagueTableViewCell else { return UITableViewCell()}
            
            cell.setupCell(name: tableViewData[indexPath.section].leagueName)
        
            return cell
            
        } else {
            
            // Here setup the embeded cell
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "teamCell") as? TeamTableViewCell else { return UITableViewCell()}
            
            cell.setupCell(logo: tableViewData[indexPath.section].teamsInLeague[indexPath.row].teamLogo,
                           teamName: tableViewData[indexPath.section].teamsInLeague[indexPath.row].teamName)
            return cell
        }
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableViewData[section].opened == true {
            return tableViewData[section].teamsInLeague.count
        } else{
            return 2 // increased this to 2 from 1 , to incorporate Main Heading.
        }
    }
    
    /// When the user taps on the cell it expands to show all the teams -
    /// - in that particular league
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableViewData[indexPath.section].opened == true {
            tableViewData[indexPath.section].opened = false
            // To make sure we have an array of section
            let section = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(section, with: .none)
        } else {
            tableViewData[indexPath.section].opened = true
            let section = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(section, with: .none)
        }
    }
}
