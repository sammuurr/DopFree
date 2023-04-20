import Foundation


class Authorization {
    
    let baseUrl: String = "http://185.181.9.137:8888/api"
    
    func registration(name: String, email: String, age: String, password: String, _ closure: @escaping (_ data: AuthorizationModel?, _ error: AuthorizationErrorModel?) -> ()) {
        let parameters = "{\n  \"name\": \"\(name)\",\n  \"email\": \"\(email)\",\n  \"age\": \(age),\n  \"password\": \"\(password)\"\n}"
        let postData = parameters.data(using: .utf8)
        
        var request = URLRequest(url: URL(string: "\(baseUrl)/reg")!,timeoutInterval: 5)
        request.addValue("application/json", forHTTPHeaderField: "accept")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.httpMethod = "POST"
        request.httpBody = postData
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                return closure(nil, nil)
            }
            let decodeData = try? JSONDecoder().decode(AuthorizationModel.self, from: data)
            let decodeError = try? JSONDecoder().decode(AuthorizationErrorModel.self, from: data)
            
            if decodeData?.token != nil{
                UserDefaults.standard.set(decodeData!.token, forKey: "token")
                UserDefaults.standard.set(decodeData!.name, forKey: "name")
                UserDefaults.standard.set(decodeData!.age, forKey: "age")
                UserDefaults.standard.set(decodeData!.email, forKey: "email")
                UserDefaults.standard.set(String(decodeData!.name.prefix(2)), forKey: "logo")
            }
            
            
            closure(decodeData, decodeError)
        }.resume()
    }
    
    func login(email: String, password: String, _ closure: @escaping (_ data: AuthorizationModel?, _ error: AuthorizationErrorModel?) -> ()) {
        let parameters = "{\n  \"email\": \"\(email)\",\n  \"password\": \"\(password)\"\n}"
        let postData = parameters.data(using: .utf8)
        
        var request = URLRequest(url: URL(string: "\(baseUrl)/login")!,timeoutInterval: 5)
        request.addValue("application/json", forHTTPHeaderField: "accept")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.httpMethod = "POST"
        request.httpBody = postData
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                return closure(nil, nil)
            }
            let decodeData = try? JSONDecoder().decode(AuthorizationModel.self, from: data)
            let decodeError = try? JSONDecoder().decode(AuthorizationErrorModel.self, from: data)
            
            if decodeData?.token != nil{
                UserDefaults.standard.set(decodeData!.token, forKey: "token")
                UserDefaults.standard.set(decodeData!.name, forKey: "name")
                UserDefaults.standard.set(decodeData!.age, forKey: "age")
                UserDefaults.standard.set(decodeData!.email, forKey: "email")
                UserDefaults.standard.set(String(decodeData!.name.prefix(2)), forKey: "logo")
            }
            
            
            closure(decodeData, decodeError)
        }.resume()
    }
}
