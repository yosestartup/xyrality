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



    func extract(json:JSON)  -> [Array<Any>]{
    
        var arrayOfWorldsDict = [Array<Any>]()
    
        
        if let worldsIsAvailable = json["allAvailableWorlds"].arrayObject
        {
           
            arrayOfWorldsDict = worldsIsAvailable as! [Array<Any>]
            for element in worldsIsAvailable {
                print(element)
            }
        }
        
        return arrayOfWorldsDict
    
}

}
