import Foundation

class ScreenController: ObservableObject {
    
    @Published var rootScreen = screens.mainScreen
    
    
    enum screens {
        case mainScreen
        case registerScreen
        case loginScreen
        case tabContentView
    }
}
