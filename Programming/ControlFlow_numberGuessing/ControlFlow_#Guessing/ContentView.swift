//
//  ContentView.swift
//  ControlFlow
//
//  Created by Yizhen Zhu - 143 on 2025-02-25.
//

import SwiftUI

struct ContentView: View {
    @State private var number = Int.random(in: 1...100)
    @State private var guess: Int = 0
    @State private var attempt: Int = 0
    @State private var result: String = ""
    @State private var guessCorrectly: Bool = false
    func generateNum()
    {
        number = Int.random(in: 1...100)
        guessCorrectly = false
        attempt=0
    }
    func compareNum()
    {
        if number > guess{
            result = "Guess a bigger Number"
            guessCorrectly = false
            attempt+=1
        }
        else if number < guess
        {
            result = "Guess a smaller Number"
            guessCorrectly = false
            attempt+=1
        }
        else
        {
            result = "That is the number!"
            guessCorrectly = true
        }
    }
    var body: some View {
        VStack {
            Text("Guess the Number!\n    (Integer, 1-100)")
                .font(.largeTitle)
            TextField("Enter your guess", value: $guess,format: .number)
                .textFieldStyle(.roundedBorder)
                .shadow(radius:10)
                .padding()
            if !guessCorrectly {
                Button(action: {compareNum()}) {
                    Text("Take a guess")
                        .font(.title)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            Text(result)
                .font(.title)
            Text("Attempt: \(attempt)")
                .font(.title3)
            .padding()
            if guessCorrectly {
                Button(action: {generateNum()}) {
                    Text("generate a new number")
                        .font(.title)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

