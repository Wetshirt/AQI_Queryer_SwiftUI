//
//  Header.swift
//  AQI_Queryer_SwiftUI
//
//  Created by 羅聖儒 on 2021/5/9.
//

import SwiftUI

struct HeaderView: View {

    var body: some View {
        VStack {
            Text("CITY").font(.title).fontWeight(.light)
            Text("SiteName").font(.title).foregroundColor(.gray)        }
    }
}


struct Header_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
