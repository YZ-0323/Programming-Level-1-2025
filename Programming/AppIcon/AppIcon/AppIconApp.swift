//
//  AppIconApp.swift
//  AppIcon
//
//  Created by Yizhen Zhu - 143 on 2025-06-02.
//
import SwiftUI
import UIKit

@main
struct AppIconApp: App {
    var body: some Scene {
        WindowGroup {
            ExportableIconView()
        }
    }
}

struct IconView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.color1) // background color

            Image(systemName: "truck.box.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 850, height: 850)
                .foregroundStyle(.color3)

            Image(systemName: "fork.knife.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
                .foregroundStyle(.color3, .color1)
                .offset(x: -160, y: -120)
        }
        .frame(width: 1024, height: 1024) // Make sure root frame is 1024x1024
    }
}

struct ExportableIconView: View {
    @State private var showSavedAlert = false

    var body: some View {
        VStack(spacing: 20) {
            IconView()
                .frame(width: 150, height: 150) // For display only, small preview
                .background(Color.white)
                .cornerRadius(0) // No rounding

            Button("Export as 1024x1024 PNG") {
                let image = IconView().snapshot(scale: 1.0) // scale 1 = 1024x1024 pixels
                UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
                showSavedAlert = true
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(12)
        }
        .padding()
        .alert("Saved to Photos", isPresented: $showSavedAlert) {
            Button("OK", role: .cancel) {}
        }
    }
}

extension View {
    func snapshot(scale: CGFloat = 1.0) -> UIImage {
        let controller = UIHostingController(rootView: self)
        let view = controller.view!

        let targetSize = CGSize(width: 1024, height: 1024)
        view.bounds = CGRect(origin: .zero, size: targetSize)
        view.backgroundColor = .clear

        controller.view.setNeedsLayout()
        controller.view.layoutIfNeeded()

        let format = UIGraphicsImageRendererFormat.default()
        format.scale = scale  // set scale here

        let renderer = UIGraphicsImageRenderer(size: CGSize(width: targetSize.width * scale, height: targetSize.height * scale), format: format)

        return renderer.image { _ in
            view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
        }
    }
}
