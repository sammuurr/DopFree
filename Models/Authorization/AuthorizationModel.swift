import Foundation

struct AuthorizationModel: Codable{
    let token: String
    let name: String
    let age: Int
    let email: String
}

struct AuthorizationErrorModel: Codable{
    let detail: String
}


