//
//  MainViewPro.swift
//  ForecastApp
//
//  Created by Admin on 8/25/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation
protocol ViewPro {
    func setData(mydata:[Forecast])
    func Message(message:String,flag:Int)
}
