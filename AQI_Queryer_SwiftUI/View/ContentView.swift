//
//  ContentView.swift
//  AQI_Queryer_SwiftUI
//
//  Created by 羅聖儒 on 2021/5/9.
//

import SwiftUI



struct ContentView: View {

    @ObservedObject var weatherViewModel = WeatherViewModel()
    
    @State var sitename : String = "新竹"
    @State var aqiArray : SearchResponse?
    @State var aqi : AQI?
    
    @State var coordinate = "lon=120.972075&lat=24.805619"  //新竹吧？
    
    @State private var isShowingSheet = false
    
    
    
    var body: some View {


            
        ZStack {
            BackgroundView()
            
            //確保資料有被載入
            if let aqi = aqi{
                VStack {

                    HeaderView(data:aqi)
                    LocationAndTemperatureHeaderView(data: weatherViewModel.currentWeather)
                    
                    Button("Change?") {
                        isShowingSheet.toggle()
                    }
                    .sheet(isPresented: $isShowingSheet, onDismiss: didDismiss) {
                        ChooseSiteView(showSheetView: $isShowingSheet, sitename: $sitename, coordinate: $coordinate, data : aqiArray!)
                    }
                    DailyWeatherCellView(data: weatherViewModel.todayWeather)
                    Rectangle().frame(height: CGFloat(1))
                    
                    HourlyWeatherView(data: weatherViewModel.hourlyWeathers)
                    Rectangle().frame(height: CGFloat(1))
                         
                    Spacer()
                    
                    CurrentAQIView(data:aqi)
                        .padding([.leading, .trailing])
                    

                    
                    //Spacer()
                    

                    PredictAQIView(data:aqi)
                    
   
                }
            }
            else{
                Text("can't load data")
            }
        }.colorScheme(.dark)
        .onAppear(perform: {
            self.getData(sitename: sitename)
        })
   
    }


}


extension ContentView {
    
    func getData(sitename: String){
        


        if let url = URL(string: AQI_URL!) {
            
            let task = URLSession.shared.dataTask(with: url)
            {(data, response, error) in
                
                let decoder = JSONDecoder()
                    DispatchQueue.main.async {
                        if let data = data {
                            do {
                                let result = try decoder.decode(SearchResponse.self, from: data)
                                
                                self.aqiArray = result
                                
                                //filter
                                for i in result.records {
                                    
                                    if i.SiteName == sitename {
                                        
                                        self.aqi =  i
                                        print(self.aqi)
                                        
                                    }

                                }
                                 
                                return
                            }
                            catch {
                                print(error)
                            }
                        }
                        else {
                            print("error")
                        }
                    }
                }
            
            task.resume()
        }

    }

    
    //closing sheet
    func didDismiss() {
        // Handle the dismissing action.
        print(sitename)
        self.getData(sitename: sitename)
        self.weatherViewModel.SetData(coordinate: self.coordinate)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
