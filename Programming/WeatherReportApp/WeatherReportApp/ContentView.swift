//
//  ContentView.swift
//  WeatherReportApp
//
//  Created by Yizhen Zhu - 143 on 2025-02-27.
//

import SwiftUI

struct ContentView: View {
    @State private var temperature: String = "20"
    @State private var weatherMessage: String = ""
    @State private var responseColor: Color = Color.black
    var body: some View {
        Text("Weather Checker")
            .alignmentGuide(HorizontalAlignment.leading) { _ in 20 }
            .font(.largeTitle)
        VStack {
            TextField("Enter temperature in celsius", text: $temperature)
                .padding()
                .keyboardType(.numberPad)
                .textFieldStyle(.roundedBorder)
            Button(action: {if let temp = Int(temperature) {
                switch temp {
                case Int.min ..< -5:
                    weatherMessage = "It's freezing! 🥶"
                    responseColor = Color.blue
                case -5..<6:
                    weatherMessage = "It's cold! 🧊"
                    responseColor = Color.cyan
                case 6..<21:
                    weatherMessage = "It's cool! 🍃"
                    responseColor = Color.green
                case 21..<31:
                    weatherMessage = "It's warm! ☀️"
                case 31..<41:
                    weatherMessage = "It's hot! 🌡️"
                    responseColor = Color.yellow
                case 41..<50:
                    weatherMessage = "It's extremely hot! 🔥"
                    responseColor = Color.orange
                default:
                    weatherMessage = "It's dangerously hot! ⚠️"
                    responseColor = Color.red
                }
            }
        }) {
            Text("Check Weather")
                .font(.title)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
            Text(weatherMessage)
                .foregroundColor(responseColor)
                .font(.title2)
                .padding()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
