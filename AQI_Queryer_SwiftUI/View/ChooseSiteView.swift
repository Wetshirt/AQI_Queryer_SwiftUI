//
//  ChooseSiteView.swift
//  AQI_Queryer_SwiftUI
//
//  Created by luo on 2021/5/16.
//

import SwiftUI

struct ChooseSiteView: View {
    
    @Binding var showSheetView: Bool
    @Binding var sitename: String
    @Binding var coordinate : String
    let data : SearchResponse

    
    var body: some View {
        NavigationView {
            
            List(data.records, id:\.SiteName) { index in
                Button("\(index.SiteName ?? "")") {
                    self.sitename = index.SiteName ?? ""
                    self.coordinate = "lon=" + (index.Longitude ?? "") + "&lat=" + (index.Latitude ?? "");
                    
                }
            }
    
            .navigationBarTitle(Text("select site"), displayMode: .inline)
                .navigationBarItems(trailing: Button(action: {
                    self.showSheetView = false
                }) {
                    Text("Done").bold()
                })
        }
    }
}

