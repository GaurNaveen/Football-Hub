//
//  EPL.swift
//  Football-Hub
//
//  Created by Naveen Gaur on 10/12/18.
//  Copyright © 2018 Naveen Gaur. All rights reserved.
//

import Foundation
import UIKit
class PremierLeague {
   
    private var team = [String: UIImage]()
    var tableViewData = [league]()

    init(){
        addTeams()
    }
    
    func addTeams() {
        team =  ["Manchester United": #imageLiteral(resourceName: "Manchester-United"),"Arsenal F.C.":#imageLiteral(resourceName: "Arsenal"),"Chelsea F.C.":#imageLiteral(resourceName: "Chelsea"),"Liverpool F.C.":#imageLiteral(resourceName: "Liverpool"),
                 "Totenham Hotspur F.C.":#imageLiteral(resourceName: "spurs"),"West Ham":#imageLiteral(resourceName: "West Ham"),"SouthHamnpton F.C.": #imageLiteral(resourceName: "1200px-FC_Southampton.svg"),
                 "Manchester City":#imageLiteral(resourceName: "Man-City"),"Fullham F.C.":#imageLiteral(resourceName: "1200px-Fulham_FC_(shield).svg"),"Wolverhampton Wanderers F.C.":#imageLiteral(resourceName: "Wolves"),
                 "Brighton & Hove Albion F.C.":#imageLiteral(resourceName: "Brighton"),"Newcastle United F.C.":#imageLiteral(resourceName: "Newcastle_United_Logo.svg"),"Crystal Palace F.C.":#imageLiteral(resourceName: "1200px-Crystal_Palace_FC_logo.svg"),
                 "Huddersfield Town A.F.C.":#imageLiteral(resourceName: "Huddersfield_Town_A.F.C._logo.svg"),"Watford F.C.":#imageLiteral(resourceName: "1200px-Watford.svg")]
    }
    
    
    func addLigue1() -> [String:UIImage] {
        var ligue1Teams = [String:UIImage]()
        ligue1Teams = ["PSG": #imageLiteral(resourceName: "PSG"),"Lyon":#imageLiteral(resourceName: "Arsenal"),"Marseille":#imageLiteral(resourceName: "Chelsea"),"OGC Nice":#imageLiteral(resourceName: "Liverpool"),
                        "Rennes":#imageLiteral(resourceName: "Ball"),"Angers":#imageLiteral(resourceName: "1200px-Angers_SCO_logo.svg"),"Toulouse": #imageLiteral(resourceName: "PSG"),
                        "Dijon FCO":#imageLiteral(resourceName: "Chelsea"),"Nantes":#imageLiteral(resourceName: "Chelsea"),"Caen":#imageLiteral(resourceName: "1200px-Fulham_FC_(shield).svg"),
                        "Monaco":#imageLiteral(resourceName: "Arsenal")]
        
        return ligue1Teams
    }
    
    var teams: [String:UIImage] {
        get {
            return self.team
        }
    }
 
}
