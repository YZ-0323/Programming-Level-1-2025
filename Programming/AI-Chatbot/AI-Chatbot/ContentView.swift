//
//  ContentView.swift
//  AI-Chatbot
//
//  Created by Yizhen Zhu - 143 on 2025-06-16.
//
import SwiftUI

struct ContentView: View {
    @State private var city = ""
    @State private var weatherDescription = ""
    @State private var temperatureC = ""
    @State private var isLoading = false
    @State private var errorMessage = ""

    var body: some View {
        VStack(spacing: 20) {
            TextField("Enter city", text: $city)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("Get Weather") {
                fetchWeather(for: city)
            }
            .padding()

            if isLoading {
                ProgressView()
            } else if !errorMessage.isEmpty {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            } else if !weatherDescription.isEmpty {
                VStack(spacing: 10) {
                    Text("Weather: \(weatherDescription)")
                        .font(.title2)
                    Text("Temperature: \(temperatureC) °C")
                        .font(.title3)
                }
                .padding()
            }

            Spacer()
        }
        .padding()
    }

    func fetchWeather(for city: String) {
        guard !city.isEmpty else {
            errorMessage = "Please enter a city name."
            return
        }

        isLoading = true
        errorMessage = ""
        weatherDescription = ""
        temperatureC = ""

        WeatherService.shared.getWeather(for: city) { result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let weather):
                    self.weatherDescription = weather.condition
                    self.temperatureC = String(format: "%.1f", weather.tempC)
                case .failure(let error):
                    self.errorMessage = "Error: \(error.localizedDescription)"
                }
            }
        }
    }
}

// MARK: - Weather model
struct Weather {
    let condition: String
    let tempC: Double
}

// MARK: - WeatherService to call weatherapi.com
class WeatherService {
    static let shared = WeatherService()

    private let apiKey = "123"
    private let baseURL = "https://api.weatherapi.com/v1/current.json"

    func getWeather(for city: String, completion: @escaping (Result<Weather, Error>) -> Void) {
        // URL encode city
        guard let cityEncoded = city.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            completion(.failure(NSError(domain: "Invalid city name", code: -1)))
            return
        }

        let urlString = "\(baseURL)?key=\(apiKey)&q=\(cityEncoded)&aqi=no"

        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: -2)))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in

            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: -3)))
                return
            }

            do {
                // Parse JSON
                let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]

                guard
                    let current = json?["current"] as? [String: Any],
                    let condition = current["condition"] as? [String: Any],
                    let text = condition["text"] as? String,
                    let tempC = current["temp_c"] as? Double
                else {
                    completion(.failure(NSError(domain: "Parsing error", code: -4)))
                    return
                }

                let weather = Weather(condition: text, tempC: tempC)
                completion(.success(weather))

            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

#Preview {
    ContentView()
}
