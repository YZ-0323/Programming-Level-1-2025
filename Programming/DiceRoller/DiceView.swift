//
//  DiceView.swift
//  DiceRoller
//
//  Created by Yizhen Zhu - 143 on 2025-03-11.
//

import SwiftUI
struct DiceView: View {
    @State private var numberOfPips: Int = 1
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .frame(width: 150, height: 200)
                .foregroundStyle(Color.white)
            VStack {
                Image(systemName: "die.face.\(numberOfPips)")
                    .resizable()
                    .frame(maxWidth: 100, maxHeight: 100)
                    .aspectRatio(1, contentMode: .fit)
                
                Button("Roll") {
                    withAnimation {
                        numberOfPips = Int.random(in: 1...6)
                    }
                }
                .font(.title3)
                .foregroundColor(.black)
                .buttonStyle(.bordered)
            }
        }
    }
}


#Preview {
    DiceView()
}
