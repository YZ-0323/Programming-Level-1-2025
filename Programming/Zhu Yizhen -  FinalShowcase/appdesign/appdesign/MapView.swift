//
//  MapView.swift
//  appdesign
//
//  Created by Yizhen Zhu - 143 on 2025-05-06.
import SwiftUI
import MapKit

struct MapView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    @State private var showCommentView = false
    @AppStorage("IsDarkMode") private var isDarkMode: Bool = false
    @AppStorage("gohome") private var gohome: Bool = false
    var body: some View {
        ZStack{
            Color(isDarkMode ? .color3 : .color1).edgesIgnoringSafeArea(.all)
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(isDarkMode ? .black : .white)
                .frame(width: 390, height: 630)
                .opacity(0.7)
            VStack {
                Text("Order Map")
                    .font(.largeTitle)
                    .padding()
                Map(coordinateRegion: $region)
                    .frame(width: 360, height: 400)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                
                Text("This is a simulated map view. Your delivery is on its way!")
                    .font(.body)
                    .foregroundColor(.gray)
                    .padding()
                
                Button("Delivered") {
                    showCommentView.toggle()

                }
                .font(.title2)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                
                Spacer()
            }
            .background(
                NavigationLink(destination: CommentView(), isActive: $showCommentView) {
                    EmptyView()
                }
                    .hidden()
            )
        }
    }
}


#Preview {
    MapView()
}
