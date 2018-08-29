//
//  Alertiew.swift
//  ForecastApp
//
//  Created by Admin on 8/29/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation
import UIKit

class AlertView
{
    class func showAlert(message:String,view:UIViewController)
{
let alert = UIAlertController(title: "Warnning !!", message: message, preferredStyle: UIAlertControllerStyle.alert)
  alert.addAction(UIAlertAction(title: "Open Settings", style: UIAlertActionStyle.default, handler: {(_) -> Void in
    guard let settingsUrl = URL(string: UIApplicationOpenSettingsURLString) else {
        return
    }
    
    if UIApplication.shared.canOpenURL(settingsUrl) {
        UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
            print("Settings opened: \(success)")
        })
    }}))
alert.addAction(UIAlertAction(title: "Not Now", style: UIAlertActionStyle.cancel, handler: {action in exit(0)}))
     view.present(alert, animated: true, completion: nil)
    }
    
    class func showSecondAlert(message:String,view:UIViewController)
    {
        let alert = UIAlertController(title: "Problem !!", message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Exit Now", style: UIAlertActionStyle.cancel, handler: {action in exit(0)}))
        view.present(alert, animated: true, completion: nil)
    }
    
}
