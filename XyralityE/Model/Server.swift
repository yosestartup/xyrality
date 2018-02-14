//
//  Server.swift
//  XyralityE
//
//  Created by Александр on 13.02.18.
//  Copyright © 2018 hilton. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class Server: NSObject {
  
    func setRequest(params:Parameters, completion: @escaping (JSON) -> ())
    {
        let urld = URL(string: "http://backend1.lordsandknights.com/XYRALITY/WebObjects/BKLoginServer.woa/wa/worlds")
        
        Alamofire.request(urld!, method: .post, parameters: params).validate().responseData(queue: nil)
        { response in
            
            switch response.result {
                
            case .success(let resp):
            let converter = PlistToJSONConverter()
            var jsonResult = converter.convert(response: resp)
            completion(jsonResult)
            
            case .failure:
            print("error")
                
            }
        }
    }
}
