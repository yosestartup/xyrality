//
//  PlistToJSONConverter.swift
//  XyralityE
//
//  Created by Александр on 13.02.18.
//  Copyright © 2018 hilton. All rights reserved.
//

import UIKit
import SwiftyJSON

class PlistToJSONConverter: NSObject {
    
    func convert (response: Data) -> JSON
    {
        var json:JSON = nil;
        do {
            let data = try Data(response)
            let dict = try PropertyListSerialization.propertyList(from: data, options: [], format: nil) as! [String:Any]
            let jsonData = try JSONSerialization.data(withJSONObject: dict , options: .prettyPrinted)
            json = JSON(jsonData)
            
        } catch {
            print(error)
        }
      return json
    }
}
