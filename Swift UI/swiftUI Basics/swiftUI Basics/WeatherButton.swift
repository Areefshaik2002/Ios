//
//  WeatherButton.swift
//  swiftUI Basics
//
//  Created by Shaik Areef on 09/02/25.
//

import SwiftUI

struct WeatherButton: View {
    
    var title : String
    var textColor : Color
    var backgroundColor : Color
    
    
        var body: some View {
            Text("Change Day View")
                .frame(width: 280, height: 50)
                .background(backgroundColor)
                .foregroundColor(textColor)
                .font(.system(size: 20, weight: .bold, design: .default))
                .cornerRadius(16)
    }
}

