//
//  ContentView.swift
//  SwiftUI-WeatherApp
//
//  Created by Ahmed Nagy on 17/12/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    /// Sample data for days of the week
    private var weatherData: [WeatherDay] = [
        WeatherDay(dayOfTheWeek: "TUE", imageName: "cloud.sun.fill", temperature: 74),
        WeatherDay(dayOfTheWeek: "WED", imageName: "sun.max.fill", temperature: 88),
        WeatherDay(dayOfTheWeek: "THU", imageName: "wind.snow", temperature: 55),
        WeatherDay(dayOfTheWeek: "FRI", imageName: "sunset.fill", temperature: 60),
        WeatherDay(dayOfTheWeek: "SAT", imageName: "snow", temperature: 25),
    ]
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            VStack {
                
                CityTextView(cityName: "Cupertino, CA")
                
                MainWeatherStatusView(imageName: isNight ? "cloud.sun.fill" : "moon.stars.fill", temperature: 76)
                
                HStack(spacing: 20) {
                    ForEach(weatherData, id: \.dayOfTheWeek) { day in
                        ExtractedView(weatherDay: day)
                    }
                }
                
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: .white)
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
    
    var weatherDay: WeatherDay
    
    var body: some View {
        VStack {
            Text(weatherDay.dayOfTheWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundStyle(.white)
            Image(systemName: weatherDay.imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(weatherDay.temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundStyle(.white)
        }
    }
}

struct BackgroundView: View {
    
    var isNight: Bool
    
    var body: some View {
//        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : .lightBlue]), startPoint: .topLeading, endPoint: .bottomTrailing)
//            .ignoresSafeArea(edges: .all)
        ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea(.all)
    }
}

struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundStyle(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundStyle(.white)
        }
        .padding(.bottom, 40)
    }
}
