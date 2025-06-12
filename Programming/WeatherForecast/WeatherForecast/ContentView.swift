//
//  ContentView.swift
//  WeatherForecast
//
//  Created by Yizhen Zhu - 143 on 2025-02-20.
//

import SwiftUI
struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack
            {
                Text("Weater Forecast for This Month")
                    .font(.title2)
                    .padding()
                    .padding()
                NavigationLink(destination: DayForecastOne()) {
                    Text("View")
                        .font(.title3)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
        }
    }
}
#Preview {
    ContentView()
}
struct DayForecastOne: View {
    var body: some View {
        NavigationView {
            VStack
            {
                Text("Weater Forecast for This Week")
                    .font(.title2)
                    .padding()
                ScrollView(.horizontal, showsIndicators: true)
                {
                    HStack {
                        DayForecast(day: "Mon", high: 21, low: 10, img: "sun.max.fill", colorOfIcon: Color.yellow)
                        
                        DayForecast(day: "Tue", high: 10, low: 4, img: "smoke.fill", colorOfIcon: Color.blue)
                        
                        DayForecast(day: "Wed", high: 15, low: 10, img: "cloud.rain.fill", colorOfIcon: Color.gray)
                        DayForecast(day: "Thu", high: 23, low: 15, img: "cloud.bolt", colorOfIcon: Color.yellow)
                        
                        DayForecast(day: "Fri", high: 7, low: 2, img: "tornado", colorOfIcon: Color.blue)
                        
                        DayForecast(day: "Sat", high: 0, low: -5, img: "wind", colorOfIcon: Color.gray)
                        DayForecast(day: "Sun", high: -5, low: -13, img: "snowflake", colorOfIcon: Color.black)
                    }
                }
                .padding()
                NavigationLink(destination: DayForecastTwo()) {
                    Text("Next Week->")
                        .font(.title3)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
        }
    }
}
#Preview {
    DayForecastOne()
}
struct DayForecastTwo: View {
    var body: some View {
        NavigationView {
            VStack
            {
                Text("Weater Forecast for Week 2")
                    .font(.title2)
                    .padding()
                ScrollView(.horizontal, showsIndicators: true)
                {
                    HStack {
                        DayForecast(day: "Mon", high: 0, low: -5, img: "snowflake", colorOfIcon: Color.black)
                        
                        DayForecast(day: "Tue", high: 4, low: 1, img: "sun.max.fill", colorOfIcon: Color.yellow)
                        
                        DayForecast(day: "Wed", high: 5, low: 1, img: "sun.max.fill", colorOfIcon: Color.yellow)
                        DayForecast(day: "Thu", high: 10, low: 8, img: "smoke.fill", colorOfIcon: Color.blue)
                        
                        DayForecast(day: "Fri", high: 15, low: 10, img: "smoke.fill", colorOfIcon: Color.blue)
                        
                        DayForecast(day: "Sat", high: 18, low: 12, img: "wind", colorOfIcon: Color.gray)
                        DayForecast(day: "Sun", high: 16, low: 11, img: "sun.max.fill", colorOfIcon: Color.yellow)
                    }
                }
                .padding()
                NavigationLink(destination: DayForecastThree()) {
                    Text("Next Week->")
                        .font(.title3)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
        }
    }
}

#Preview {
    DayForecastTwo()
}

struct DayForecastThree: View {
    var body: some View {
        NavigationView {
            VStack
            {
                Text("Weater Forecast for Week 3")
                    .font(.title2)
                    .padding()
                ScrollView(.horizontal, showsIndicators: true)
                {
                    HStack {
                        DayForecast(day: "Mon", high: 21, low: 10, img: "sun.max.fill", colorOfIcon: Color.yellow)
                        
                        DayForecast(day: "Tue", high: 10, low: 4, img: "smoke.fill", colorOfIcon: Color.blue)
                        
                        DayForecast(day: "Wed", high: 15, low: 10, img: "cloud.rain.fill", colorOfIcon: Color.gray)
                        DayForecast(day: "Thu", high: 23, low: 15, img: "cloud.bolt", colorOfIcon: Color.yellow)
                        
                        DayForecast(day: "Fri", high: 7, low: 2, img: "tornado", colorOfIcon: Color.blue)
                        
                        DayForecast(day: "Sat", high: 0, low: -5, img: "wind", colorOfIcon: Color.gray)
                        DayForecast(day: "Sun", high: -5, low: -13, img: "snowflake", colorOfIcon: Color.black)
                    }
                }
                .padding()
                NavigationLink(destination: DayForecastFour()) {
                    Text("Next Week->")
                        .font(.title3)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
        }
    }
}
struct DayForecastFour: View {
    var body: some View {
        NavigationView {
            VStack
            {
                Text("Weater Forecast for Week 4")
                    .font(.title2)
                    .padding()
                ScrollView(.horizontal, showsIndicators: true)
                {
                    HStack {
                        DayForecast(day: "Mon", high: 21, low: 10, img: "sun.max.fill", colorOfIcon: Color.yellow)
                        
                        DayForecast(day: "Tue", high: 10, low: 4, img: "smoke.fill", colorOfIcon: Color.blue)
                        
                        DayForecast(day: "Wed", high: 15, low: 10, img: "cloud.rain.fill", colorOfIcon: Color.gray)
                        DayForecast(day: "Thu", high: 23, low: 15, img: "cloud.bolt", colorOfIcon: Color.yellow)
                        
                        DayForecast(day: "Fri", high: 7, low: 2, img: "tornado", colorOfIcon: Color.blue)
                        
                        DayForecast(day: "Sat", high: 0, low: -5, img: "wind", colorOfIcon: Color.gray)
                        DayForecast(day: "Sun", high: -5, low: -13, img: "snowflake", colorOfIcon: Color.black)
                    }
                }
                .padding()
            }
        }
    }
}
#Preview {
    DayForecastFour()
}

struct DayForecast: View {
    let day: String
    let high: Int
    let low: Int
    let img: String
    let colorOfIcon: Color
    var body: some View {
        VStack {
            Text(day)
            Image(systemName: img)
                .foregroundStyle(colorOfIcon)
            Text("High: \(high)")
            Text("Low: \(low)")
        }
        .padding()
    }
}
