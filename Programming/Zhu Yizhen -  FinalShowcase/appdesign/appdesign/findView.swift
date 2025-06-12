//
//  findView.swift
//  appdesign
//
//  Created by Yizhen Zhu - 143 on 2025-05-22.
//



import SwiftUI

struct findView: View {
    let burgerKing = Restaurant(
        name: "Burger King",
        tags: [
            "burger", "fast food", "american", "whopper", "grilled", "fries",
            "onion rings", "coca cola", "breakfast", "value menu", "milkshake",
            "cheeseburger", "beef", "dessert", "chicken sandwich"
        ],
        menu: [
            "Whopper", "Bacon King", "Chicken Fries", "Impossible Whopper",
            "Classic Fries", "Onion Rings", "Double Cheeseburger", "Croissan'wich",
            "Pancake Platter", "Vanilla Shake"
        ],
        menuPrices: [
            "Whopper": 5.99, "Bacon King": 6.99, "Chicken Fries": 4.49, "Impossible Whopper": 6.49,
            "Classic Fries": 2.49, "Onion Rings": 2.49, "Double Cheeseburger": 3.99, "Croissan'wich": 3.49,
            "Pancake Platter": 4.99, "Vanilla Shake": 3.49
        ]
    )
    let mcDonalds = Restaurant(name: "McDonald's", tags: [
        "burger", "fast food", "american", "fries", "coca cola", "coke",
        "chicken nuggets", "breakfast", "dessert", "big mac", "combo meals",
        "beef", "cheeseburger", "kids", "value menu"
    ], menu: [
        "Big Mac", "McChicken", "Quarter Pounder", "Chicken Nuggets",
        "Filet-O-Fish", "Fries", "Egg McMuffin", "Sausage Biscuit",
        "Apple Pie", "McFlurry"
    ], menuPrices: [
        "Big Mac": 5.99, "McChicken": 3.49, "Quarter Pounder": 6.49, "Chicken Nuggets": 4.99,
        "Filet-O-Fish": 4.79, "Fries": 1.99, "Egg McMuffin": 3.99, "Sausage Biscuit": 2.79,
        "Apple Pie": 1.29, "McFlurry": 3.49
    ])
    
    let subway = Restaurant(name: "Subway", tags: [
        "sandwich", "healthy", "american", "sub", "salad", "fresh", "vegetarian",
        "customizable", "low calorie", "meal deal", "cold cuts", "wrap",
        "lunch", "chicken", "vegan options"
    ], menu: [
        "Italian B.M.T.", "Turkey Breast", "Veggie Delight", "Chicken Teriyaki",
        "Tuna", "Meatball Marinara", "Black Forest Ham", "Steak & Cheese",
        "Rotisserie-Style Chicken", "Oven Roasted Chicken"
    ], menuPrices: [
        "Italian B.M.T.": 5.99, "Turkey Breast": 5.49, "Veggie Delight": 4.99, "Chicken Teriyaki": 6.49,
        "Tuna": 5.99, "Meatball Marinara": 5.49, "Black Forest Ham": 5.49, "Steak & Cheese": 6.99,
        "Rotisserie-Style Chicken": 6.49, "Oven Roasted Chicken": 5.99
    ])
    @AppStorage("foodpref") private var foodpref: String = "None"
    @State private var searchQuery = ""
    let restaurants = sampleRestaurants
    @AppStorage("IsDarkMode") private var isDarkMode: Bool = false
    @State private var showDetailViewForSubway = false
    @State private var showDetailViewForMcDonalds = false
    @State private var showDetailViewForBurgerKing = false
    @State private var selectedRestaurant: Restaurant? = nil
    var body: some View {
        let colorScheme = isDarkMode ? ColorScheme.dark : ColorScheme.light
        ZStack{
            Color(isDarkMode ? .color3 : .color1).edgesIgnoringSafeArea(.all)
            VStack{
                NavigationView {
                    ScrollView(.horizontal, showsIndicators: true)
                    {
                        HStack{
                            findRestaurants(rating: 4, name: "TestRestaurant")
                            findRestaurants(rating: 5, name: "TestRestaurant2")
                            findRestaurants(rating: 4, name: "TestRestaurant3")
                            findRestaurants(rating: 3, name: "TestRestaurant4")
                            findRestaurants(rating: 5, name: "TestRestaurant5")
                        }
                        Spacer()
                    }
                    
                    .navigationTitle("Find Restaurants")
                    .preferredColorScheme(colorScheme)
                }
                .cornerRadius(15)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill((isDarkMode ? .black : .white)).opacity(0.7))
                .frame(width: 400, height: 350)
                
                NavigationView {
                    ScrollView(.vertical, showsIndicators: true)
                    {
                        VStack(alignment: .leading, spacing: 15) {
                            
                            HStack(alignment: .top, spacing: 10) {
                                Image(systemName: "person.circle.fill")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.gray)
                                VStack(alignment: .leading) {
                                    HStack{
                                        Text("username")
                                            .font(.headline)
                                        Spacer()
                                        Text("From: Subway")
                                    }
                                    HStack{
                                        Text("Great food!")
                                            .font(.body)
                                        Spacer()
                                        Button("View Store") {
                                            showDetailViewForSubway = true
                                        }
                                        .font(.subheadline)
                                        .foregroundColor(.blue)
                                        .padding(.top, 4)
                                    }
                                    Spacer()
                                }
                                .sheet(isPresented: $showDetailViewForSubway) {
                                    ZStack {
                                        Color(isDarkMode ? .color3 : .color1).edgesIgnoringSafeArea(.all)
                                            .ignoresSafeArea()
                                        DetailView(restaurant: subway)
                                            .frame(width: 360, height: 710)
                                            .background(isDarkMode ? .black : .white)
                                            .cornerRadius(15)
                                            .padding()
                                            .background(RoundedRectangle(cornerRadius: 20).fill((isDarkMode ? .black : .white)).opacity(0.7))
                                    }
                                }

                            }
                            
                            
                            HStack(alignment: .top, spacing: 10) {
                                Image(systemName: "person.circle.fill")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.gray)
                                VStack(alignment: .leading) {
                                    HStack{
                                        Text("username2")
                                            .font(.headline)
                                        Spacer()
                                        Text("From: McDonald's")
                                    }
                                    HStack {
                                        Text("The burger is good")
                                            .font(.body)
                                        Spacer()
                                        Button("View Store") {
                                            showDetailViewForMcDonalds = true
                                        }
                                        .font(.subheadline)
                                        .foregroundColor(.blue)
                                        .padding(.top, 4)
                                    }
                                    Spacer()
                                }
                                .sheet(isPresented: $showDetailViewForMcDonalds) {
                                    ZStack {
                                        Color.color1.opacity(0.2)
                                            .ignoresSafeArea()

                                        DetailView(restaurant: mcDonalds)
                                            .frame(width: 360, height: 710)
                                            .background(isDarkMode ? .black : .white)
                                            .cornerRadius(15)
                                            .padding()
                                            .background(RoundedRectangle(cornerRadius: 20).fill((isDarkMode ? .black : .white)).opacity(0.7))
                                    }
                                }
                            }
                            
                            
                            HStack(alignment: .top, spacing: 10) {
                                Image(systemName: "person.circle.fill")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.gray)
                                VStack(alignment: .leading) {
                                    HStack{
                                        Text("username3")
                                            .font(.headline)
                                        Spacer()
                                        Text("From: Burger King")
                                    }
                                    HStack{
                                        Text("not bad")
                                            .font(.body)
                                        Spacer()
                                        Button("View Store") {
                                            showDetailViewForBurgerKing = true
                                        }
                                        .font(.subheadline)
                                        .foregroundColor(.blue)
                                        .padding(.top, 4)
                                    }
                                    Spacer()
                                }
                                .sheet(isPresented: $showDetailViewForBurgerKing) {
                                    ZStack {
                                        Color.blue.opacity(0.2)
                                            .ignoresSafeArea()

                                        DetailView(restaurant: burgerKing)
                                            .frame(width: 360, height: 710)
                                            .background(isDarkMode ? .black : .white)
                                            .cornerRadius(15)
                                            .padding()
                                            .background(RoundedRectangle(cornerRadius: 20).fill((isDarkMode ? .black : .white)).opacity(0.7))
                                    }
                                }
                            }
                            }
                            .padding()
                            .navigationTitle("Comments")
                            .preferredColorScheme(colorScheme)
                        }
                    }
                    .cornerRadius(15)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 20).fill((isDarkMode ? .black : .white)).opacity(0.7))
                    .frame(width: 400, height: 350)
            }
        }
    }
}


#Preview {
    findView()
}

struct findRestaurants: View {
    @AppStorage("IsDarkMode") private var isDarkMode: Bool = false
    var rating: Int
    let name: String
    let starImage = "star.fill"
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 15)
                .frame(width: 130, height: 150)
                .foregroundStyle(Color(isDarkMode ? .color3 : .color1))
                .padding()
            VStack {
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: 100, height: 80)
                        .foregroundStyle(Color(isDarkMode ? .black : .white))
                    Text("ICON")
                        .font(.caption2)
                }
                Text(name)
                    .foregroundStyle(Color(isDarkMode ? .white: .black))
                    HStack {
                        ForEach(1..<6) { index in
                                Image(systemName: rating >= index ? starImage : "star")
                                    .resizable()
                                    .foregroundColor(rating >= index ? .yellow : .gray)
                                    .font(.title)
                                    .frame(width: 15, height: 15)
                            
                        }
                    }
                
            }
        }
    }
}
