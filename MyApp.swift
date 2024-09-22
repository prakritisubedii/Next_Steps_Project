import SwiftUI

@main
struct YourAppNameApp: App {
    @StateObject private var userData = UserData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(userData)
        }
    }
}
