//
//  Homeview.swift
//  TabsAndNavigation
//
//  Created by Yizhen Zhu - 143 on 2025-04-07.
//

import Foundation

struct OrderHistory: Identifiable, Codable {
    var id = UUID()
    var restaurantName: String
    var orderedItems: [String]
    var totalPrice: Double
    var comment: String
    var rating: Int
    var date: Date
}

import SwiftUI

struct HomeView: View {
    @State private var searchQuery = ""
    let restaurants = sampleRestaurants
    @AppStorage("IsDarkMode") private var isDarkMode: Bool = false
    @AppStorage("foodpref") private var foodpref: String = "None"

    var body: some View {
        ZStack{
            Color(isDarkMode ? .color3 : .color1).edgesIgnoringSafeArea(.all)
            NavigationView {
                VStack {
                    TextField("Search by restaurant or food type", text: $searchQuery)
                        .padding(7)
                        .background(Color(.systemGray4))
                        .cornerRadius(8)
                        .padding(.horizontal)

                    List(filteredRestaurants) { restaurant in
                        NavigationLink(destination: DetailView(restaurant: restaurant)) {
                            VStack(alignment: .leading) {
                                Text(restaurant.name)
                                    .font(.headline)
                                let maxTagsToShow = 3
                                let visibleTags = restaurant.tags.prefix(maxTagsToShow)
                                let tagLine = visibleTags.joined(separator: ", ") + (restaurant.tags.count > maxTagsToShow ? "..." : "")

                                Text(tagLine)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            .padding(.vertical, 5)
                        }
                    }
                    .navigationTitle("Recommendations")
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .padding()
            .background(RoundedRectangle(cornerRadius: 20).fill((isDarkMode ? .black : .white)).opacity(0.7))
            .frame(width: 400, height: 710)
        }
    }

    var filteredRestaurants: [Restaurant] {
        let query = searchQuery.lowercased()
        let pref = foodpref.lowercased()

        return restaurants.filter { restaurant in
            let matchesSearch = query.isEmpty || restaurant.name.lowercased().contains(query) ||
                restaurant.tags.contains(where: { $0.lowercased().contains(query) })

            let matchesPreference = pref == "none" || restaurant.tags.contains(where: { $0.lowercased().contains(pref) })

            return matchesSearch && matchesPreference
        }
    }
}

struct DetailView: View {
    let restaurant: Restaurant
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.presentationMode) var presentationMode
    @State private var isOrderPlaced = false
    @State private var isOrderSent = false
    @State private var foodQuantities: [String: Int] = [:]
    @State private var showCart = false

    @AppStorage("orderHistories") private var orderHistoriesData: Data = Data()

    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 10) {
                Text(restaurant.name)
                    .font(.largeTitle)
                    .padding(.top)

                ScrollView {
                    ZStack{
                        Rectangle()
                            .frame(width: 100, height: 100)
                            .foregroundStyle(.color1)
                        Text("ICON")
                            .font(.title)
                    }
                    Text("-Test description-")
                        .font(.headline)
                        .padding()
                    Text("Sample description for the restaurant.")
                        .font(.caption)
                        .padding()
                    VStack {
                        ForEach(restaurant.menu, id: \.self) { food in
                            let price = restaurant.menuPrices[food] ?? 0.0
                            let quantity = foodQuantities[food] ?? 0

                            VStack(alignment: .leading) {
                                HStack {
                                    Text(food)
                                        .font(.body)
                                    Spacer()
                                    Text("$\(String(format: "%.2f", price))")
                                }

                                HStack {
                                    Stepper("Quantity: \(quantity)", value: Binding(get: {
                                        foodQuantities[food] ?? 0
                                    }, set: {
                                        foodQuantities[food] = $0
                                    }), in: 0...10)
                                }
                            }
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(10)
                        }
                        Text("Tags: \(restaurant.tags.joined(separator: ", "))")
                            .font(.footnote)
                            .foregroundColor(.gray)
                            .padding(.top, 10)

                        Spacer(minLength: 80)
                    }
                }

                if !isOrderPlaced {
                    Button(action: {
                        withAnimation {
                            showCart = true
                        }
                    }) {
                        let totalItems = foodQuantities.values.reduce(0, +)
                        Text("View Cart (\(totalItems) item\(totalItems != 1 ? "s" : ""))")
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                            .padding()
                    }
                }


                if isOrderPlaced {
                    DoneView()
                    NavigationLink(destination: MapView()) {
                        Text("Track Order on Map")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }
                }
            }

            if showCart {
                Color.black.opacity(0.7).edgesIgnoringSafeArea(.all)
                    .onTapGesture { withAnimation { showCart = false } }

                VStack(alignment: .leading) {
                    HStack {
                        Spacer()
                        Button(action: { withAnimation { showCart = false } }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.gray)
                                .font(.title2)
                        }
                    }

                    Text("Cart")
                        .font(.title)
                        .padding(.vertical)

                    ForEach(foodQuantities.keys.sorted(), id: \.self) { item in
                        let quantity = foodQuantities[item] ?? 0
                        if quantity > 0 {
                            let price = (restaurant.menuPrices[item] ?? 0.0) * Double(quantity)
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("\(item) x\(quantity)")
                                    Text("$\(String(format: "%.2f", price))")
                                }
                                Spacer()
                                Button(action: {
                                    foodQuantities[item] = 0
                                }) {
                                    Image(systemName: "trash")
                                        .foregroundColor(.red)
                                }
                            }
                            .padding(.vertical, 4)
                        }
                    }

                    let totalPrice = foodQuantities.reduce(0.0) { acc, pair in
                        acc + (restaurant.menuPrices[pair.key] ?? 0.0) * Double(pair.value)
                    }

                    Text("Total: $\(String(format: "%.2f", totalPrice))")
                        .font(.headline)
                        .padding(.top)

                    Button("Place Order") {
                        let items = foodQuantities.flatMap { item, qty in Array(repeating: item, count: qty) }
                        let newOrder = OrderHistory(
                            restaurantName: restaurant.name,
                            orderedItems: items,
                            totalPrice: totalPrice,
                            comment: "No comment yet",
                            rating: 0,
                            date: Date()
                        )

                        var existingOrders: [OrderHistory] = []
                        if let decoded = try? JSONDecoder().decode([OrderHistory].self, from: orderHistoriesData) {
                            existingOrders = decoded
                        }
                        existingOrders.append(newOrder)

                        if let encoded = try? JSONEncoder().encode(existingOrders) {
                            orderHistoriesData = encoded
                        }

                        isOrderSent = true
                        isOrderPlaced = true
                        showCart = false
                    }
                    .buttonStyle(.borderedProminent)
                    .padding(.top)
                    .disabled(foodQuantities.values.allSatisfy { $0 == 0 })
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color(.systemBackground)))
                .frame(maxHeight: UIScreen.main.bounds.height * 0.75)
                .padding(.horizontal)
                .transition(.move(edge: .bottom))
                .zIndex(1)
                .animation(.easeInOut(duration: 0.3), value: showCart)
            }

            NavigationLink(destination: FaceIDView(isOrderPlaced: $isOrderPlaced), isActive: $isOrderSent) {
                EmptyView()
            }.hidden()
        }
        .navigationTitle(restaurant.name)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image(systemName: "chevron.left.circle.fill")
                        Text("Back")
                    }
                }
            }
        }
    }
}

struct DoneView: View {
    var body: some View {
        VStack {
            Text("Done!")
                .font(.largeTitle)
                .foregroundStyle(.color1)
        }
    }
}

struct FaceIDView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var isOrderPlaced: Bool

    var body: some View {
        ZStack {
            Color(.systemBackground).edgesIgnoringSafeArea(.all)
            VStack(spacing: 20) {
                Text("Authenticating...")
                    .font(.title2)
                    .padding()

                Circle()
                    .fill(Color.blue)
                    .frame(width: 100, height: 100)
                    .shadow(radius: 10)

                Text("Face ID")
                    .font(.headline)
                    .foregroundColor(.gray)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                isOrderPlaced = true
                dismiss()
            }
        }
    }
}

#Preview {
    HomeView()
}
