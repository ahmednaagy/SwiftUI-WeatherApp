//
//  WeatherButton.swift
//  SwiftUI-WeatherApp
//
//  Created by Ahmed Nagy on 20/12/2023.
//

import SwiftUI

struct WeatherButton: View {
    
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor)
            .foregroundStyle(textColor)
            .font(.headline)
            .clipShape(.buttonBorder)
    }
}
