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
         self.hideKeyboard()
       
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
        
     //MARK: textfields validation
        if loginField.text?.isEmpty ?? true {
            let alert = UIAlertController(title: "Login field is empty", message: "Enter a text and try to search again", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
            
        if passwordField.text?.isEmpty ?? true {
             let alert = UIAlertController(title: "Password field is empty", message: "Enter a text and try to search again", preferredStyle: UIAlertControllerStyle.alert)
             alert.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.default, handler: nil))
             self.present(alert, animated: true, completion: nil)
        }
        
    }
    
   //MARK: Preparation for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! AvailableWorldsController
        destinationVC.parameters = parameters
        
        //UI Reset
        loginField.text = ""
        passwordField.text = ""
    }
    }

extension UIViewController {
    
    func hideKeyboard()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
}
