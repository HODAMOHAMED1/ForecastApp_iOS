//
//  ViewController.swift
//  ForecastApp
//
//  Created by Admin on 8/25/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import Foundation
import SDWebImage

class ViewController: UIViewController,ViewPro,UITableViewDelegate,UITableViewDataSource {
    var presenter:PresenterPro!
    var allData=[Forecast]()
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate=self
        tableview.dataSource=self
        tableview.separatorColor=UIColor(white: 0.95, alpha: 1)
        presenter=Presenter(view: self)
            }
    override func viewDidAppear(_ animated: Bool) {
        presenter.getData()
    }
    
    func setData(mydata: [Forecast]) {
        self.allData=mydata
        self.tableview.reloadData()
        print("data\(self.allData.count)")
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("hii\(self.allData.count)")
        return self.allData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.contentView.backgroundColor=UIColor(white: 0.95, alpha: 1)
        cell.dayname.text=self.allData[indexPath.row].weekday
        cell.date.text = String(self.allData[indexPath.row].year!)+" "+self.allData[indexPath.row].month!+" "+String(self.allData[indexPath.row].day!)
        cell.hightemp.text = self.allData[indexPath.row].high_celsius!+"°C"
        cell.lowtemp.text = self.allData[indexPath.row].low_celsius!+"°C"
        let iconurl = URL(string: self.allData[indexPath.row].icon_url!)
        cell.icon.sd_setImage(with:iconurl)
        return cell
    }
    
    func Message(message: String,flag:Int) {
        if flag == 0
        {
         
            ToastView.showToast(message: message, view: self.view)
        
        }
        else if flag == 1
        {
        AlertView.showAlert(message: message, view: self)
        }
        else
        {
            AlertView.showSecondAlert(message: message, view: self)
        }
    }
}
