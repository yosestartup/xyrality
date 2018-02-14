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
 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }
    
    //MARK: Initializers
    var parameters:Parameters?
    @IBOutlet var loginField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBAction func logIn(_ sender: Any) {
  
    //MARK: Get device data
    let deviceData = DeviceData()
    let uuid = deviceData.uuid
    let deviceInfoString = deviceData.deviceInfoString
    
    //MARK: Parameters generating (for request)
     parameters = [
            "login": loginField.text,
            "password": passwordField.text,
            "deviceType": deviceInfoString,
            "deviceId": uuid
            ]
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! AvailableWorldsController
        destinationVC.parameters = parameters
    }
    
}

