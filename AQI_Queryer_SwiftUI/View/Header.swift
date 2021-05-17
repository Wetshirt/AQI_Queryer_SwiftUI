//
//  Header.swift
//  AQI_Queryer_SwiftUI
//
//  Created by 羅聖儒 on 2021/5/9.
//

import SwiftUI



struct HeaderView: View {

    
    let data: AQI

    
    var body: some View {
     
        VStack {
            Text("\(data.County ?? "--")").font(.title)
            Text("\(data.SiteName ?? "--")").font(.title).fontWeight(.light)
 
        }
    
    }
}



