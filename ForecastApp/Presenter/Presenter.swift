//
//  Presenter.swift
//  ForecastApp
//
//  Created by Admin on 8/25/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation
class Presenter: NSObject ,PresenterPro{
    var view :ViewPro!
    var model:ModelPro!
     init(view:ViewPro) {
        super.init()
        self.view=view
        self.initPresenter()
     }
    func initPresenter()
    {
        model=Model(presenter: self)
    }

    func getData() {
      model.getData()
    }
    func setData(mydata: [Forecast]) {
        self.view.setData(mydata: mydata)
    }
    func Message(message: String,flag:Int) {
        self.view.Message(message: message,flag:flag)
    }
    
    
}
