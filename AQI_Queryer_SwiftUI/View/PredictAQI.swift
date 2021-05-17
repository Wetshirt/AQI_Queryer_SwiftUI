//
//  PredictAQI.swift
//  AQI_Queryer_SwiftUI
//
//  Created by 羅聖儒 on 2021/5/9.
//

import SwiftUI
import CoreML

struct PredictAQIView: View {

    let data : AQI
    
    var body: some View {


        VStack {
            HStack {
                Text("8 hours Forecast")
                    .foregroundColor(.gray)  
                
                Spacer()
                }.padding(.leading)
            
            Divider()
                .padding([.leading, .trailing])
            
            
            ForEach(1..<8) {index in
                HStack {
                    
                    
                    Text("\(Int(getPrediction(data: data, time: Double(index))))")
                    
                    

                    Spacer()
                    Text("\(calculateHour(data: data, hour:  Double(index)))")
 
                    }.padding([.leading, .trailing])
            }
            
                 
             
        }
        
    }
}

extension PredictAQIView {
    
    func getPrediction(data: AQI, time : Double)->Double{
        
        

        let model = TabularRegressor()
        
        do {
            let prediction = try
                
                
                model.prediction(SiteName: data.SiteName!, DataCreationDate: calculateHour(data: data, hour: time))
            
  
            return prediction.AQI
    
        } catch {
            print("can't predict moedl")
        }
        
        return -1
 
    }
    
    
    //get Optional("2021/05/17 17:00:00"))) to String(17:00)
    func  calculateHour(data: AQI, hour: Double)->String{
        

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd  HH:mm:ss"
        var date = dateFormatter.date(from: data.PublishTime!)
        
        date = date! + hour * 3600

        
        //conver to string
        let str = dateFormatter.string(from: date!)
        
        //Hello, playground
        let start = str.index(str.startIndex, offsetBy: 12)
        let end = str.index(str.endIndex, offsetBy: -3)
        let range = start..<end

        
        return String(str[range])
        
    }
    

    
}

