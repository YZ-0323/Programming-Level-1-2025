//
//  SecondWelcome.swift
//  appdesign
//
//  Created by Yizhen Zhu - 143 on 2025-04-11.
//

import SwiftUI

struct SecondWelcome: View {
    var body: some View {
        ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 350, height: 150)
                    .foregroundStyle(.color1)
                    .opacity(0.3)
            VStack{
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 50, height: 50)
                        .foregroundStyle(.color1)
                        Image(systemName: "truck.box.fill")
                            .font(.system(size: 26))
                            .foregroundStyle(.color3)
                        Text("  ")
                        Image(systemName: "fork.knife.circle.fill")
                            .font(.system(size: 13))
                            .foregroundStyle(.color3, .color1)
                            .offset(x: -6, y: -4)
                }
                Text("-The APP Made For Food Ordering-")
                    .font(.title3)
                    .foregroundColor(.color3)
                    
                Text("We provide people of all ages and all kinds\n        with the best food delivery service")
                    .font(.subheadline)
                    .foregroundColor(.color3)
            }
            .padding()
        }
        .padding()
        ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 350, height: 200)
                    .foregroundStyle(.color1)
                    .opacity(0.3)
            VStack{
                Text("New Features")
                    .font(.title)
                    .foregroundColor(.color3)
                Text("Version 1.0")
                    .font(.title)
                    .foregroundColor(.color3)
                    
                Text("• Food Ordering\n• Online Payment\n• Recommendations")
                    .font(.title2)
                    .foregroundColor(.color3)
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    SecondWelcome()
    
}
