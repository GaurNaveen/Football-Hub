//
//  SelectTeamViewController.swift
//  Football-Hub
//
//  This file is responsible for showing the user
//  all the leagues and the teams in them , so that
//  they can select their fav team.
//
//  Created by Naveen Gaur on 10/12/18.
//  Copyright © 2018 Naveen Gaur. All rights reserved.
//

import UIKit

/// Stores the league names and the teams in it.
struct league {
    var opened = Bool()
    var leagueName = String()
    var teamsInLeague = [team]()
}

/// Stores the a particular team logo and it's name.
struct team {
    var teamLogo = UIImage()
    var teamName = String()
}

class SelectTeamViewController: UIViewController {
    var tableViewData = [league]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addDataToTableView()
    }
    
    /// Adds the league and it's respective team to the table view cells.
    func addDataToTableView(){
        addPremierLeague()
        addLigue1Teams()
    }
    
    /// Adds the French League to the table view.
    func addLigue1Teams() {
        let teamLeagues = PremierLeague.init()
        var teamData = [team]()
        let  data = teamLeagues.addLigue1()
        // Circle over the dictionary to retrive the team's image and it's image.
        for (key,value) in data {
            teamData.append(team(teamLogo: value, teamName: key))
        }
        // Add it to the table view.
        tableViewData.append(league(opened: false, leagueName: "Ligue 1", teamsInLeague: teamData))
    }
    
    /// Adds the English League to the table view.
    func addPremierLeague() {
        let teamLeagues = PremierLeague.init()
        var teamData = [team]()
        // Circle over the dictionary to retrive the team's image and it's image.
        for (key,value) in teamLeagues.teams {
            teamData.append(team(teamLogo: value, teamName: key))
        }
        // Add data to table view.
        tableViewData.append(league(opened: false, leagueName: "England - Premier League", teamsInLeague: teamData))
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

        // For the League Heading we use a different cell.
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
        } else {
            
            // MARK: Here you can play around with the expanded cell.
            tableView.cellForRow(at: indexPath)?.selectionStyle = .none
            let cell = tableView.cellForRow(at: indexPath) as! TeamCell
            cell.teamView.layer.borderColor = UIColor.init(netHex: 0xED3B6B).cgColor
            cell.teamView.layer.borderWidth = 5.0
            
            //print(indexPath)
            
            // Add a method here so that if the user chooses the wrong team , the border disappears.
            // first check if that has border, if true boom , make it clear.
            // Don't use deselect. Creat a normal func here.
            
            // After the user selects the team take him to the next view.
        }
    }
    
    
}

