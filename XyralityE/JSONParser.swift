//
//  JSONParser.swift
//  XyralityE
//
//  Created by Александр on 13.02.18.
//  Copyright © 2018 hilton. All rights reserved.
//

import UIKit
import SwiftyJSON

class JSONParser: NSObject {

    func extract(json:JSON) -> [String]  {
    
        var worldNameArray = [String]()
        var worldsArray = [Dictionary<String,Any>]()
        
        if let worldsIsAvailable = json["allAvailableWorlds"].arrayObject {
            
            for element in worldsIsAvailable {
                worldsArray.append(element as! [String : Any])
                
            }
            
            for element in worldsArray  {
                worldNameArray.append(element["name"] as! String)
                
            }
        }
    return worldNameArray
        
}
}
