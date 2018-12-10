//
//  SelectTeamViewController.swift
//  Football-Hub
//
//  Created by Naveen Gaur on 10/12/18.
//  Copyright © 2018 Naveen Gaur. All rights reserved.
//

import UIKit

class SelectTeamViewController: UIViewController {
    var tableViewData = [league]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupTableViewData()

    }
    
    func setupTableViewData() {
        // Break them into 5 differnt methods , each method for one league.
        tableViewData = [league(opened: false, leagueName: "England - Premier League", teamsInLeague:                                   [team(teamLogo: #imageLiteral(resourceName: "Manchester-United"), teamName: "Manchester United"),team(teamLogo: #imageLiteral(resourceName: "Arsenal"), teamName: "Arsenal  F.C."),team(teamLogo: #imageLiteral(resourceName: "Liverpool"), teamName: "Liverpool F.C."),team(teamLogo: #imageLiteral(resourceName: "Chelsea"), teamName: "Chelsea F.C.")] ),league(opened: false, leagueName: "Ligue 1", teamsInLeague: [team(teamLogo: #imageLiteral(resourceName: "Chelsea"), teamName: "PSG")])]
    }

}

extension SelectTeamViewController  : UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableViewData[section].opened == true {
            return tableViewData[section].teamsInLeague.count + 1  // + 20 and then -20 for the above "dataIndex"
        } else{
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dataIndex = indexPath.row - 1

        // For the Main Heading we use a different cell.
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "leagueCell") as? LeagueCell else {return UITableViewCell()}
            cell.setupCell(name: tableViewData[indexPath.section].leagueName)
            return cell
            
        } else {
            // Here begins the part for setting up the expanded cells.
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "teamCell") as? TeamCell else { return UITableViewCell()}
            
            cell.setupCell(logo: tableViewData[indexPath.section].teamsInLeague[dataIndex].teamLogo,
                           teamName: tableViewData[indexPath.section].teamsInLeague[dataIndex].teamName)
            return cell
        }
       
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // We don't want the expanded view to close when we click on a cell, "if indexpath.row==0" prevents that.
        if(indexPath.row == 0) {
            if tableViewData[indexPath.section].opened == true {
                tableViewData[indexPath.section].opened = false
                tableView.cellForRow(at: IndexPath.init(row: 0, section: 2))?.selectionStyle = .none
                
                print(indexPath)
                // To make sure we have an array of section
                let section = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(section, with: .none)
            } else {
                tableViewData[indexPath.section].opened = true
                tableView.cellForRow(at: IndexPath.init(row: 0, section: 2))?.selectionStyle = .none
                
                let section = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(section, with: .none)
            }
        }
    }
    
}

