//
//  aqiData.swift
//  AQI_Queryer_SwiftUI
//
//  Created by 羅聖儒 on 2021/5/9.
//

import Foundation

let AQI_URL = "https://data.epa.gov.tw/api/v1/aqx_p_432?limit=1000&api_key=9be7b239-557b-4c10-9775-78cadfc555e9&format=json".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)


struct SearchResponse: Codable {

    let records: [AQI]
    
}

struct AQI: Codable{
    let SiteName:String?
    let County:String?
    let AQI:String?
    let PM25: String?
    let Status: String?
    let PublishTime:String?
    let Longitude: String?
    let Latitude: String?
    
    //Parse 出來的是PM2.5
    enum CodingKeys: String, CodingKey {
        case SiteName
        case County
        case AQI
        case PM25 = "PM2.5"
        case Status
        case PublishTime
        case Longitude
        case Latitude
    }
    
    init() {
        self.SiteName = "--"
        self.County = "--"
        self.AQI = "--"
        self.PM25 = "--"
        self.Status = "--"
        self.PublishTime = "--"
        self.Longitude = "__"
        self.Latitude = "__"

    }
    
}
