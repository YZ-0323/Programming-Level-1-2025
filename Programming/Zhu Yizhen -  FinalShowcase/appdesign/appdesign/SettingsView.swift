//
//  SettingsView.swift
//  TabsAndNavigation
//
//  Created by Yizhen Zhu - 143 on 2025-04-07.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("IsDarkMode") private var isDarkMode: Bool = false
    var body: some View {
        ZStack{
            Color(isDarkMode ? .color3 : .color1).edgesIgnoringSafeArea(.all)
            ZStack{
                RoundedRectangle(cornerRadius: 30)
                    .frame(width: 370, height: 350)
                    .foregroundStyle(.color2)
                    .opacity(0.7)
                RoundedRectangle(cornerRadius: 30)
                    .frame(width: 390, height: 370)
                    .foregroundStyle(.white)
                    .opacity(0.3)
                VStack {
                    Text("Settings")
                        .font(.largeTitle)
                        .foregroundColor(.black)
                        .padding()
                    Toggle("Enable Notifications", isOn: .constant(true))
                        .foregroundColor(.black)
                        .padding()
                    Toggle("Enable Sound", isOn: .constant(false))
                        .foregroundColor(.black)
                        .padding()
                    Toggle("Face ID", isOn: .constant(true))
                        .foregroundColor(.black)
                        .padding()
                }
            }
            
            .navigationTitle("Settings")
        }
    }

}
#Preview {
    SettingsView()
}

