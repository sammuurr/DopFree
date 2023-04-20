import Foundation

struct UserModel: Identifiable, Hashable {
    let id = UUID()
    var name: String
    var age: String
    var email: String
    var logo: String
}
    
