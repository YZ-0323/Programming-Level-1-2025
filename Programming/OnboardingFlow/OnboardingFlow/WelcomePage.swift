//
//  ContentView.swift
//  OnboardingFlow
//
//  Created by Yizhen Zhu - 143 on 2025-03-10.
//
import SwiftUI


struct WelcomePage: View {
    var body: some View {
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .frame(width: 150, height: 150)
                        .foregroundStyle(.indigo)
                    Image(systemName: "fork.knife")
                        .font(.system(size: 80))
                        .foregroundStyle(.white)
                }
                Text("Welcome to MyApp")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.top)
                    .foregroundColor(.white)
                Text("-This is a desctption-")
                    .font(.title2)
                    .foregroundColor(.white)
            }
            .padding()
    }
}


#Preview {
    WelcomePage()
}

