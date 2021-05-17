//
//  Background.swift
//  AQI_Queryer_SwiftUI
//
//  Created by 羅聖儒 on 2021/5/9.
//


import SwiftUI

struct BackgroundView: View {
    var body: some View {
        let colorScheme = [Color.blue,
                           Color(red: 128/255, green: 255/255, blue: 255/255),
                           Color(red: 140/255, green: 200/255, blue: 255/255)]
        
        let gradient = Gradient(colors: colorScheme)
        let linearGradient = LinearGradient(gradient: gradient, startPoint: .top, endPoint: .bottom)
        
        let background = Rectangle()
            .fill(linearGradient)
            .blur(radius: 200, opaque: true)
            .edgesIgnoringSafeArea(.all)
        
        return background
    }
}

struct Background_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
