//
//  PredictAQI.swift
//  AQI_Queryer_SwiftUI
//
//  Created by 羅聖儒 on 2021/5/9.
//

import SwiftUI

struct PredictAQIView: View {
  
    var body: some View {
        VStack {
            HStack {
                Text("8 hours Forecast")
                    .foregroundColor(.gray)  
                
                Spacer()
                }.padding(.leading)
            
            Divider()
                .padding([.leading, .trailing])
            /*
            ForEach(data.data.identified(by: \.day)) { data in
                ZStack {
                    HStack {
                        Text(data.day)
                        Spacer()
                        Text(data.temperatureHigh).padding(8)
                        Text(data.temperatureLow).color(.gray)
                        }.padding([.leading, .trailing])
                    
                    Image(data.icon)
                        .resizable()
                        .aspectRatio(UIImage(named: data.icon)!.size, contentMode: .fit)
                        .frame(width: 50, height: 25)
                }
            }
             */
        }
    }
}

