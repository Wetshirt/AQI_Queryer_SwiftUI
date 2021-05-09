//
//  ContentView.swift
//  AQI_Queryer_SwiftUI
//
//  Created by 羅聖儒 on 2021/5/9.
//

import SwiftUI

struct ContentView: View {

    @State var aqiArray: SearchResponse?
    @State var currentaqi : AQI?

    
    
    var body: some View {
        


        ZStack {
            BackgroundView()
            
            VStack {
                //HeaderView(data: networkManager.currentWeather)
                HeaderView()

                Spacer()
                
                CurrentAQIView()
                    .padding([.leading, .trailing])
                
                Spacer()
                
                //DailyWeatherView(data: networkManager.dailyWeather)
                PredictAQIView()
                
                //FooterView()
            }
        }.colorScheme(.dark)
        .onAppear(perform: self.getData)
        
        

        

        

    }
}


extension ContentView {
    
    func getData() {
        

        if let url = URL(string: AQI_URL!) {
            
            let task = URLSession.shared.dataTask(with: url)
            {(data, response, error) in
                
                let decoder = JSONDecoder()
                
                if let data = data {
                    do {
                        let aqiArray = try decoder.decode(SearchResponse.self, from: data)

                        
                        DispatchQueue.main.async {
                            self.aqiArray = aqiArray
                        }

                    }
                    catch {
                        print(error)
                    }
                }
                else {
                    print("error")
                }
            }
            task.resume()
        }
    }
    

  
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
