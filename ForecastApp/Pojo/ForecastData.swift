//
//  ForecastData.swift
//  ForecastApp
//
//  Created by Admin on 8/25/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation
import SwiftyJSON
class Forecast: NSObject {
    var day:Int?
    var weekday:String?
    var month:String?
    var year:Int?
    var icon_url:String?
    var high_celsius:String?
    var low_celsius:String?
    
    init(jsonData:JSON) {
        if let daydata = jsonData["date"]["day"].int
        {
            day=daydata
        }
        if let dayname=jsonData["date"]["weekday"].string
        {
            weekday=dayname
        }
        if let monthdata = jsonData["date"]["monthname_short"].string
        {
            month=monthdata
        }
        if let yeardata=jsonData["date"]["year"].int
        {
            year=yeardata
        }
        if let icon=jsonData["icon_url"].string
        {
            icon_url=icon
        }
        if let high=jsonData["high"]["celsius"].string
        {
            high_celsius=high
        }
        if let low=jsonData["low"]["celsius"].string
        {
            low_celsius=low
        }
    }
}
