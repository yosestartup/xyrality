//
//  AvailableWorldsController.swift
//  XyralityE
//
//  Created by Александр on 13.02.18.
//  Copyright © 2018 hilton. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
class AvailableWorldsController: UITableViewController {

    //MARK: Initializer
    var worldsArray = [String]()
    var parameters:Parameters?
    let server = Server()
  
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
         //MARK: Server request
        var jsonLocal:JSON?
        server.setRequest(params: parameters!) { (json) in
        jsonLocal = json
        let parser = JSONParser()
        self.worldsArray = parser.extract(json: json)
        self.tableView.reloadData()
            
        }
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
 
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return worldsArray.count
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellTemp", for: indexPath)
        cell.textLabel?.text = worldsArray[indexPath.row]
        return cell
        
    }

}
