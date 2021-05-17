//
//  CurrentAQI.swift
//  AQI_Queryer_SwiftUI
//
//  Created by 羅聖儒 on 2021/5/9.
//

import SwiftUI

struct CurrentAQIView: View {
    
    let data: AQI
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {

                
                Text("\(data.Status ?? "--")")
                    .font(.title)
                    .fontWeight(.light)
                }.padding(0)
            
            HStack {
                Text("\(data.AQI ?? "--")")
                    .font(.system(size: 120))
                    .fontWeight(.ultraLight)
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("PM25")
                        Spacer()
                        Text("\(data.PM25 ?? "--")")
                        }.padding(.bottom, 1)
                    
                    HStack {
                        Text("Publish Date")
                        Spacer()
                        Text("\(data.PublishTime ?? "--")")
                        }.padding(.bottom, 1)
                    
                    }.font(.caption)
                }.padding(0)
        }
    }
}
