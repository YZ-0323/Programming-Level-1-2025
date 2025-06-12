//
//  FeaturesPage2.swift
//  OnboardingFlow
//
//  Created by Yizhen Zhu - 143 on 2025-03-11.
//

import SwiftUI

struct FeaturesPage2: View {
    var body: some View {
        ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 400, height: 150)
                    .foregroundStyle(.indigo)
                    .opacity(0.6)
            VStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 50, height: 50)
                        .foregroundStyle(.white)
                    Image(systemName: "fork.knife")
                        .font(.system(size: 30))
                        .foregroundStyle(.indigo)
                }
                Text("-This is my discription for My App.-")
                    .font(.title3)
                    .foregroundColor(.white)
                    
                Text("This is a test")
                    .font(.subheadline)
                    .foregroundColor(.white)
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    FeaturesPage2()
}
