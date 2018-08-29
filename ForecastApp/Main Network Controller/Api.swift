//
//  Api.swift
//  ForecastApp
//
//  Created by Admin on 8/25/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Api: NSObject ,ApiPro{
    
    var model:ModelPro!
    var all=[Forecast]()
    var count:Int=0
    var cacheddata:CachedURLResponse?
    
    init(model:ModelPro) {
        super.init()
        self.model=model
    }
    
    func getData() {
        var request = URLRequest(url: URL(string: "http://api.wunderground.com/api/838ed9367e8876bf/forecast/q/EG/Cairo.json")!)
        request.cachePolicy = .returnCacheDataDontLoad
        //check if cached data exist
        if let cacheResponse = URLCache.shared.cachedResponse(for: request)
        {
            cacheddata=cacheResponse
            let json = JSON(cacheResponse.data)
            self.parseJson(json: json)
        }
        else
        {
            if !CheckInternet.Connection()
            {
                // no cached data or internet connection
                self.model.Message(message: "No Data To Show Please Check Your Connection",flag:1)
            }
        }
        //check internet connection
        if CheckInternet.Connection()
        {
            //change cachepolicy to ignore local cache and get data from network
            request.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
       // get response
        Alamofire.request(request).responseJSON { response in
            
            guard response.result.error==nil else
            {
                if self.count < 2
                {
                self.count+=1;
                self.getData()
                }
                if self.cacheddata == nil
                {
                    self.model.Message(message: "Server Not Found", flag: 2)
                }
                else
                {
                    self.model.Message(message: "Server Not Found",flag:0)
                }
                return
            }
            guard let jsonobj=response.result.value as? [String:Any] else{
                print("didn't get object as JSON from API")
                print("Error: \(response.result.error)")
                return
            }
           let json = JSON(jsonobj)
           self.parseJson(json: json)
        }
        }
    }
    
// function to parse response
func parseJson(json:JSON)
{
    let forecast = json["forecast"]["simpleforecast"]["forecastday"]
    print("data\(forecast)")
    if forecast.count > 0
    {
        for i in 0...forecast.count-1
        {
            let forcastobj = Forecast(jsonData:forecast[i])
            self.all.append(forcastobj)
            print(forcastobj.icon_url)
        }
    }
    self.model.setData(mydata: self.all)
}
    
}
