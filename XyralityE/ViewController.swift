//
//  ViewController.swift
//  XyralityE
//
//  Created by Александр on 13.02.18.
//  Copyright © 2018 hilton. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: UI init
    @IBOutlet var loginField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBAction func logIn(_ sender: Any) {
        
    //MARK: Get device data
   let deviceData = DeviceData()
   let model = deviceData.model
   let systemVersion = deviceData.systemVersion
   let systemName = deviceData.systemName
   let uuid = deviceData.uuid
   let deviceInfoString = "\(model) - \(systemName) - \(systemVersion)"
        
    //MARK: Server request
     let server = Server()
     let parameters:Parameters = [
//            "login": "ios.test@xyrality.com",
//            "password": "password",
//            "deviceType": "iPhone9,4",
//            "deviceId": "0000000000",
            "login": loginField.text,
            "password": passwordField.text,
            "deviceType": deviceInfoString,
            "deviceId": uuid
            ]
     
      server.setRequest(params: parameters)
    
    }
    
    //
}

