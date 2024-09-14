import SwiftUI

@main
struct macthxApp: App {
    var body: some Scene {
        
        let version = "1.94.2"
        
        WindowGroup {
            ContentView()
                .navigationTitle("macthx")
        }
        .defaultSize(width: 100, height: 300)
        .commands{
            CommandGroup(after: .appInfo) {
                Text("Version " + version)
            }
        }
    }
}
