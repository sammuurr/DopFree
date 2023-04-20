import SwiftUI

@main
struct projektApp: App {
    
    @ObservedObject var screen = ScreenController()
    
    var body: some Scene {
        WindowGroup{
            Group{
                switch screen.rootScreen {
                case .mainScreen:
                    MainContentView(screen: screen)
                case .loginScreen:
                    LoginContentView(screen: screen)
                case .registerScreen:
                    RegisterContentView(screen: screen)
                case .tabContentView:
                    TabContentView()
                }
            }
            .transition(
                .asymmetric(insertion: .move(edge: .trailing),
                            removal: .move(edge: .leading))
                .combined(with: .opacity)
            )
            .animation(.easeInOut(duration: 0.25), value: screen.rootScreen)
        }
    }
}
