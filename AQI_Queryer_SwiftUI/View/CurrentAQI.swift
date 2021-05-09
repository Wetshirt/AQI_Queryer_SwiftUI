//
//  CurrentAQI.swift
//  AQI_Queryer_SwiftUI
//
//  Created by 羅聖儒 on 2021/5/9.
//

import SwiftUI

struct CurrentAQIView: View {

    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {

                
                Text("Status")
                    .font(.title)
                    .fontWeight(.light)
                }.padding(0)
            
            HStack {
                Text("100")
                    .font(.system(size: 120))
                    .fontWeight(.ultraLight)
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("PM25")
                        Spacer()
                        Text("70")
                        }.padding(.bottom, 1)
                    
                    HStack {
                        Text("Publish Date")
                        Spacer()
                        Text("Date")
                        }.padding(.bottom, 1)
                    
                    }.font(.caption)
                }.padding(0)
        }
    }
}
