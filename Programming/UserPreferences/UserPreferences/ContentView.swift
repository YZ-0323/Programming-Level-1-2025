//
//  ContentView.swift
//  UserPreferences
//
//  Created by Yizhen Zhu - 143 on 2025-04-08.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("IsDarkMode") private var isDarkMode: Bool = false
    @AppStorage("username") private var username: String = "Guest"
    
    @AppStorage("favoriteColor") private var favoriteColor: String = "Blue"
    private let colors = ["red", "green", "blue", "yellow", "purple"]
    
    func colorForString(_ color: String) -> Color {
            switch color.lowercased() {
            case "red": return .red
            case "green": return .green
            case "blue": return .blue
            case "yellow": return .yellow
            case "purple": return .purple
            default: return .black
            }
        }
    var body: some View {
        let colorScheme = isDarkMode ? ColorScheme.dark : ColorScheme.light
        
        NavigationView {
            Form {
                Section(header: Text("Appearance")) {
                    Toggle("Dark Mode", isOn: $isDarkMode)
                        .toggleStyle(SwitchToggleStyle(tint: .green))
                }
                
                Section(header: Text("User Info")) {
                    TextField("Enter your name", text: $username)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                Section(header: Text("Preferences")) {
                    
                    Picker("Favorite Color", selection: $favoriteColor) {
                        
                        ForEach(colors, id: \.self) { color in
                            
                            Text(color.capitalized).tag(color)
                            
                        }
                        
                    }
                }
            }
            .navigationTitle("User Preferences")
            .preferredColorScheme(colorScheme)
            
        }
        
        VStack (spacing: 0) {
            Text("Good, your username is \(username)")
                .padding()
            Text("Darkmode is set to \(isDarkMode ? "On" : "Off")")
                .padding()
            HStack (spacing: 0) {
                Text("Your favorite color is ") +
                Text(favoriteColor.capitalized).foregroundColor(colorForString(favoriteColor))
            }
            .padding()
        }
    }
}


#Preview {
    ContentView()
}
