
//
//  ProfileView.swift
//  TabsAndNavigation
//
//  Created by Yizhen Zhu - 143 on 2025-04-07.
//

import SwiftUI

struct ProfileView: View {
    @AppStorage("foodpref") private var foodpref: String = "None"
    @AppStorage("IsDarkMode") private var isDarkMode: Bool = false
    @AppStorage("username") private var username: String = "Guest"
    @AppStorage("favoriteColor") private var favoriteColor: String = "Blue"
    private let colors = ["red", "green", "blue", "yellow", "purple"]
    @AppStorage("description") private var description: String = ""
    @AppStorage("orderHistories") private var orderHistoriesData: Data = Data()
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
        ZStack {
            Color(isDarkMode ? .color3 : .color1).edgesIgnoringSafeArea(.all)
            ScrollView(.vertical) {
                VStack {
                    HStack {
                        Image(systemName: "person.circle")
                            .resizable()
                            .frame(width: 50, height: 50)
                        Text(username)
                            .font(.largeTitle)
                    }


                    VStack {
                        NavigationView {
                            List {

                                ForEach(groupedOrders.keys.sorted(), id: \.self) { restaurant in
                                    NavigationLink(destination: HistoryView(title: restaurant)) {
                                        Text(restaurant)
                                    }
                                }
                            }
                            .navigationTitle("History")
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 20).fill((isDarkMode ? .black : .white))).opacity(0.7)
                    
                    
                    


                    VStack {
                        NavigationView {
                            List {
                                TextField("description", text: $description)
                            }
                            .navigationTitle("Description")
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 20).fill((isDarkMode ? .black : .white))).opacity(0.7)
                       


                    let colorScheme = isDarkMode ? ColorScheme.dark : ColorScheme.light
                    VStack {
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
                                Section(header: Text("Food Choice"))
                                {
                                    TextField("Place your food preference here", text: $foodpref)
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                }
                            }
                            
                            .navigationTitle("User Preferences")
                            .preferredColorScheme(colorScheme)
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 20).fill((isDarkMode ? .black : .white))).opacity(0.7)

                    VStack(spacing: 0) {
                        Text("Good, your username is \(username)")
                            .padding()
                        Text("Darkmode is set to \(isDarkMode ? "On" : "Off")")
                            .padding()
                        HStack(spacing: 0) {
                            Text("Your favorite color is ") +
                                Text(favoriteColor.capitalized).foregroundColor(colorForString(favoriteColor))
                        }
                        .padding()
                    }
                }
               
            }
        }
    }


    var groupedOrders: [String: [OrderHistory]] {
        guard let decoded = try? JSONDecoder().decode([OrderHistory].self, from: orderHistoriesData) else {
            return [:]
        }
        var grouped: [String: [OrderHistory]] = [:]
        

        for order in decoded {
            if grouped[order.restaurantName] == nil {
                grouped[order.restaurantName] = []
            }
            grouped[order.restaurantName]?.append(order)
        }
        

        return grouped.filter { !$0.value.isEmpty }
    }
}

struct HistoryView: View {
    @AppStorage("orderHistories") private var orderHistoriesData: Data = Data()
    var title: String
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    clearHistory()
                }) {
                    Text("Clear History")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 150, height: 40)
                        .background(Color.red)
                        .cornerRadius(10)
                }
                .padding(.trailing)
            }
            .padding()

            ScrollView {
                VStack(alignment: .leading) {
                    Text("Order History for \(title)")
                        .font(.title2)
                        .padding()
                    

                    ForEach(filteredOrders) { order in
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Items: \(order.orderedItems.joined(separator: ", "))")
                            Text("Total: $\(String(format: "%.2f", order.totalPrice))")
                            if order.rating > 0 {
                                HStack(spacing: 2) {
                                    Text("Rating:")
                                    ForEach(1...5, id: \.self) { i in
                                        Image(systemName: i <= order.rating ? "star.fill" : "star")
                                            .foregroundColor(i <= order.rating ? .yellow : .gray)
                                    }
                                }
                            }
                            Text("Comment: \(order.comment.isEmpty ? "No comment" : order.comment)")
                                .padding(.vertical, 4)
                                .frame(maxWidth: .infinity)
                                .border(Color.gray, width: 1)
                            Text("Date: \(order.date.formatted(.dateTime.year().month().day().hour().minute()))")
                                .font(.footnote)
                                .foregroundColor(.gray)
                        }
                        .padding(.vertical, 5)
                    }


                }
                .padding()
            }
        }
    }
    

    private func clearHistory() {
        orderHistoriesData = Data()
    }

    var filteredOrders: [OrderHistory] {
        guard let decoded = try? JSONDecoder().decode([OrderHistory].self, from: orderHistoriesData) else {
            return []
        }
        return decoded.filter { $0.restaurantName == title }
    }
}


#Preview {
    ProfileView()
}

