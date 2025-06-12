import SwiftUI
import MapKit
import CoreMotion
import LocalAuthentication
import UserNotifications

struct ContentView: View {
    @State private var isCameraPresented = false
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    @State private var accelerometerData = "No Data"
    private let motionManager = CMMotionManager()
    @State private var hapticFeedback = UINotificationFeedbackGenerator()
    @State private var isAuthenticated = false
    @State private var notificationPermissionGranted = false

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Device Features")) {
                    Button("Open Camera") {
                        isCameraPresented = true
                    }
                    .sheet(isPresented: $isCameraPresented) {
                        CameraView()
                    }

                    NavigationLink("MapKit Demo") {
                        MapView(region: $region)
                    }

                    NavigationLink("CoreMotion Demo") {
                        CoreMotionView(accelerometerData: $accelerometerData, motionManager: motionManager)
                    }

                    Button("Trigger Haptic Feedback") {
                        hapticFeedback.notificationOccurred(.success)
                    }

                    Button("Authenticate with Biometrics") {
                        authenticate()
                    }
                    .alert("Authentication \(isAuthenticated ? "Succeeded" : "Failed")", isPresented: .constant(!isAuthenticated)) {
                        Button("OK", role: .cancel) {}
                    }

                    Button("Send Notification") {
                        sendNotification()
                    }
                }
            }
            .navigationTitle("Device Features")
            .onAppear {
                requestNotificationPermission()
            }
        }
    }

    func authenticate() {
        let context = LAContext()
        var error: NSError?

        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "We need to authenticate you.") { success, _ in
                DispatchQueue.main.async {
                    isAuthenticated = success
                }
            }
        } else {
            isAuthenticated = false
        }
    }

    func requestNotificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, _ in
            DispatchQueue.main.async {
                notificationPermissionGranted = granted
            }
        }
    }

    func sendNotification() {
        guard notificationPermissionGranted else { return }

        let content = UNMutableNotificationContent()
        content.title = "Hello!"
        content.body = "This is a notification from your app."
        content.sound = .default

        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: nil)
        UNUserNotificationCenter.current().add(request)
    }
}

struct CameraView: View {
    var body: some View {
        Text("Camera View Placeholder")
            .font(.headline)
    }
}

struct MapView: View {
    @Binding var region: MKCoordinateRegion

    var body: some View {
        Map(coordinateRegion: $region)
            .ignoresSafeArea()
    }
}

struct CoreMotionView: View {
    @Binding var accelerometerData: String
    let motionManager: CMMotionManager

    var body: some View {
        VStack {
            Text("Accelerometer Data:")
                .font(.headline)
            Text(accelerometerData)
                .padding()

            Button("Start Motion Updates") {
                startMotionUpdates()
            }
        }
        .onDisappear {
            motionManager.stopAccelerometerUpdates()
        }
    }

    func startMotionUpdates() {
        if motionManager.isAccelerometerAvailable {
            motionManager.accelerometerUpdateInterval = 0.2
            motionManager.startAccelerometerUpdates(to: .main) { data, error in
                guard let data = data, error == nil else { return }
                accelerometerData = "X: \(data.acceleration.x), Y: \(data.acceleration.y), Z: \(data.acceleration.z)"
            }
        } else {
            accelerometerData = "Accelerometer not available."
        }
    }
}

#Preview {
    ContentView()
}
