//
//  ContentView.swift
//  Calculator
//
//  Created by Yizhen Zhu - 143 on 2025-02-18.
//

import SwiftUI

struct ContentView: View {
    @State private var number1: Int = 0
    @State private var number2: Int = 0
    @State private var result: String = "0"
    @State private var symbol: String = ""
    
    //function
    func calculateSum() {
        result = String(number1 + number2)
    }
    func calculateDif() {
        result = String(number1 - number2)
    }
    func calculateMtp() {
            result = String(number1 * number2)
    }
    func calculateDvd() {
        if(number1==0 && number2==0)
        {
            result = "N/A"
        }
        else
        {
            result = String(format:"%.4f", Float(number1) / Float(number2))
        }
    }
    
    var body: some View {
        //input
        VStack{
            Text("Basic Calculator")
                .font(.largeTitle)
                .padding()
            Text("-Input INTEGERS only!-")
                .font(.title)
                .padding()
            Text("Number 1")
                .font(.title3)
                .padding()
            TextField("Enter first number", value: $number1,
                      format: .number)
            .textFieldStyle(.roundedBorder)
            .shadow(radius:10)
            .padding()
            Text("Number 2")
                .font(.title3)
                .padding()
            TextField("Enter second number", value: $number2,
                      format: .number)
            
            .textFieldStyle(.roundedBorder)
            .shadow(radius:10)
            .padding()
            
            HStack{
                //sum
                Button(action: { calculateSum()
                    symbol="+"
                }) {
                    Text("Add         ")
                        .font(.title)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                //difference
                Button(action: { calculateDif()
                    symbol="−"
                }) {
                    Text("Subtract")
                        .font(.title)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            HStack{
                //multiply
                Button(action: { calculateMtp()
                    symbol="×"
                }) {
                    Text("Multiply ")
                        .font(.title)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                //divide
                Button(action: { calculateDvd()
                    symbol="÷"
                }) {
                    Text("Divide    ")
                        .font(.title)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            
            //output
            Text("\(Int(number1)) \(symbol) \(Int(number2)) = \(result)")
                .font(.largeTitle)
                .padding()
        }
        .padding()
    }
}
    #Preview {
        ContentView()
    }
