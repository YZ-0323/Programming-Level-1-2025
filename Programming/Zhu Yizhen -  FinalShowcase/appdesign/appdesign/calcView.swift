//
//  calcView.swift
//  appdesign
//
//  Created by Yizhen Zhu - 143 on 2025-05-26.
//
import SwiftUI

struct Food: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let calories: Int
}

struct calcView: View {
    @State private var searchText = ""
    @AppStorage("IsDarkMode") private var isDarkMode: Bool = false
    @AppStorage("calorieLimit") private var calorieLimit: Int = 0
    @State private var selectedCalories: Int = 0
    @State private var isSettingLimit: Bool = false
    @State private var newLimitText: String = ""
    @State private var selectedFoods: [Food: Int] = [:] // [Food: count]
    @State private var showingSelectedView = false

    let foods: [Food] = [
        Food(name: "Big Mac", calories: 550),
        Food(name: "McChicken", calories: 400),
        Food(name: "Quarter Pounder", calories: 520),
        Food(name: "Chicken Nuggets", calories: 440),
        Food(name: "Filet-O-Fish", calories: 380),
        Food(name: "Fries", calories: 320),
        Food(name: "Egg McMuffin", calories: 310),
        Food(name: "Sausage Biscuit", calories: 460),
        Food(name: "Apple Pie", calories: 230),
        Food(name: "McFlurry", calories: 510)
    ]

    func addFood(_ food: Food) {
        selectedCalories += food.calories
        selectedFoods[food, default: 0] += 1
    }
    
    func removeFood(_ food: Food) {
        if let count = selectedFoods[food], count > 0 {
            selectedCalories -= food.calories
            if count == 1 {
                selectedFoods.removeValue(forKey: food)
            } else {
                selectedFoods[food] = count - 1
            }
        }
    }

    var body: some View {
        ZStack {
            Color(isDarkMode ? .color3 : .color1).edgesIgnoringSafeArea(.all)

            VStack(spacing: 16) {
                NavigationStack {
                    List {
                        ForEach(foods.filter {
                            searchText.isEmpty || $0.name.localizedCaseInsensitiveContains(searchText)
                        }) { food in
                            HStack {
                                Text(food.name)
                                Spacer()
                                Text("\(food.calories) kcal")
                                    .foregroundColor(.secondary)

                                HStack(spacing: 2) {
                                    Image(systemName: "fork.knife.circle.fill")
                                        .foregroundColor(selectedFoods[food] != nil ? .blue : .gray)
                                        .font(.system(size: 20))
                                    if let count = selectedFoods[food], count > 1 {
                                        Text("×\(count)")
                                            .font(.caption)
                                            .foregroundColor(.blue)
                                    }
                                }
                            }
                            .contentShape(Rectangle())
                            
                            .onTapGesture {
                                addFood(food)
                            }
                        }
                    }
                    .navigationTitle("Calorie Calculator")
                    .searchable(text: $searchText)
                }
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(isDarkMode ? .black : .white).opacity(0.7))

                VStack(spacing: 10) {
                    Text("Total Selected: \(selectedCalories) kcal")
                        .foregroundColor(selectedCalories > calorieLimit ? .red : .green)
                        .font(.headline)

                    Text("Daily Limit: \(calorieLimit) kcal")
                        .foregroundColor(isDarkMode ? .white : .secondary)

                    HStack {
                        Button("Set Calorie Limit") {
                            isSettingLimit = true
                            newLimitText = "\(calorieLimit)"
                        }
                        .padding(6)
                        .background(Color.blue.opacity(0.2))
                        .cornerRadius(10)

                        Button("View Selected") {
                            showingSelectedView = true
                        }
                        .padding(6)
                        .background(Color.green.opacity(0.2))
                        .cornerRadius(10)
                        .sheet(isPresented: $showingSelectedView) {
                            SelectedFoodView(selectedFoods: $selectedFoods, selectedCalories: $selectedCalories, removeFood: removeFood)
                        }
                        
                    }
                    Text("*Suggested calories/day: 1600-2400kcal*")
                        .foregroundColor(isDarkMode ? .white : .secondary)
                        .underline()

                }
                .padding()
            }
        }
        .alert("Set Daily Calorie Limit", isPresented: $isSettingLimit) {
            TextField("e.g. 2000", text: $newLimitText)
                .keyboardType(.numberPad)
            Button("Save") {
                if let newLimit = Int(newLimitText), newLimit > 0 {
                    calorieLimit = newLimit
                }
            }
            Button("Cancel", role: .cancel) {}
        }
    }
}

struct SelectedFoodView: View {
    @Binding var selectedFoods: [Food: Int]
    @Binding var selectedCalories: Int
    var removeFood: (Food) -> Void
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(Array(selectedFoods.keys), id: \.self) { food in
                    if let count = selectedFoods[food] {
                        HStack {
                            Text(food.name)
                            Spacer()
                            Text("×\(count) = \(food.calories * count) kcal")
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .navigationTitle("Selected Items")
            .toolbar {
                EditButton()
            }
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        for index in offsets {
            let food = Array(selectedFoods.keys)[index]
            if let count = selectedFoods[food] {

                selectedCalories -= food.calories * count
            }
            selectedFoods.removeValue(forKey: food)
        }
    }
}

#Preview {
    calcView()
}

