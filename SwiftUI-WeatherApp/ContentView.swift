//
//  ContentView.swift
//  SwiftUI-WeatherApp
//
//  Created by Ahmed Nagy on 17/12/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .lightBlue]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea(edges: .all)
            VStack {
                
                Text("Cupertino, CA")
                    .font(.system(size: 32, weight: .medium, design: .default))
                    .foregroundStyle(.white)
                    .padding()
                
                VStack(spacing: 8) {
                    Image(systemName: "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                    
                    Text("76°")
                        .font(.system(size: 70, weight: .medium))
                        .foregroundStyle(.white)
                }
                .padding(.bottom, 40)
                
                HStack(spacing: 20) {
                    ExtractedView(dayOfTheWeek: "TUE", imageName: "cloud.sun.fill", temperature: 74)
                    ExtractedView(dayOfTheWeek: "WED", imageName: "sun.max.fill", temperature: 88)
                    ExtractedView(dayOfTheWeek: "THU", imageName: "wind.snow", temperature: 55)
                    ExtractedView(dayOfTheWeek: "FRI", imageName: "sunset.fill", temperature: 60)
                    ExtractedView(dayOfTheWeek: "SAT", imageName: "snow", temperature: 25)
                }
                
                Spacer()
                
                Button {
                    print("Tapped")
                } label: {
                    Text("Change Day Time")
                        .frame(width: 280, height: 50)
                        .background(.white)
                        .font(.headline)
                        .clipShape(.buttonBorder)
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct ExtractedView: View {
    
    var dayOfTheWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfTheWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundStyle(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundStyle(.white)
        }
    }
}
