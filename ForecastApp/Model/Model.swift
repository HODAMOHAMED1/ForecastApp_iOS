//
//  Model.swift
//  ForecastApp
//
//  Created by Admin on 8/25/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation
class Model: NSObject ,ModelPro{

    var api:ApiPro!
    var presenter:PresenterPro!
    init(presenter:PresenterPro) {
        super.init()
        self.presenter=presenter
        self.initModel()
    }
    func initModel()
    {
        api=Api(model: self)
    }
    func getData() {
        api.getData()
    }
    func setData(mydata: [Forecast]) {
        self.presenter.setData(mydata: mydata)
    }
    func Message(message: String,flag:Int) {
        self.presenter.Message(message: message,flag:flag)
    }
    
}
