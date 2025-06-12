//
//  ContentView.swift
//  DiceRoller
//
//  Created by Yizhen Zhu - 143 on 2025-03-11.
//


import SwiftUI
let gradientColors: [Color] = [
    .gradientTop,
    .gradientBottom
    
]
struct ContentView: View {
@State private var numberOfDice: Int = 1
    var body: some View {
        VStack {
            Text("Dice Roller")
                .font(.largeTitle.lowercaseSmallCaps())
                .foregroundColor(.white)
                ScrollView(.horizontal)
                {
                    HStack {
                    ForEach(1...numberOfDice, id: \.description) { _ in
                        DiceView()
                        }
                    }
                }
            HStack {
                Button("Remove Dice", systemImage: "minus.circle.fill") {
                    withAnimation {
                        numberOfDice -= 1
                    }
                }
                .font(.title2)
                .foregroundColor(.white)
                .disabled(numberOfDice == 1)
                
                Button("Add Dice", systemImage: "plus.circle.fill") {
                    withAnimation {
                        numberOfDice += 1
                    }
                }
                .font(.title2)
                .foregroundColor(.white)
                .disabled(numberOfDice == 5)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Gradient(colors: gradientColors))
        .tabViewStyle(.page)
    }
}
#Preview {
    ContentView()
}
