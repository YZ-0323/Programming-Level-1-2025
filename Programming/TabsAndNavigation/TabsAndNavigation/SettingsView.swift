//
//  SettingsView.swift
//  TabsAndNavigation
//
//  Created by Yizhen Zhu - 143 on 2025-04-07.
//

import SwiftUI

struct SettingsView: View {

    var body: some View {
        VStack {

            Text("Settings")

                .font(.largeTitle)

                .padding()

            Toggle("Enable Notifications", isOn: .constant(true))

                .padding()
            Toggle("Dark Mode", isOn: .constant(false))

                .padding()
            Toggle("Enable Sound", isOn: .constant(true))

                .padding()
            Toggle("DDDDDDDDDDDD", isOn: .constant(false))

                .padding()

        }

        .navigationTitle("Settings")

    }

}
#Preview {
    SettingsView()
}
