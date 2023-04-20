import Foundation

class Stat {
    
    func getWeekStat(closure: @escaping (_ stat: WeekStatModel?) -> ()){
        let token = UserDefaults.standard.string(forKey: "token")
        
        let parameters = "{\n  \"token\": \"\(token ?? "")\"\n}"
        let postData = parameters.data(using: .utf8)
        
        var request = URLRequest(url: URL(string: "http://185.181.9.137:8888/api/get_week_stat")!,timeoutInterval: Double.infinity)
        request.addValue("application/json", forHTTPHeaderField: "accept")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.httpMethod = "POST"
        request.httpBody = postData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                return closure(nil)
            }
            
            let decodeData = try? JSONDecoder().decode(WeekStatModel.self, from: data)
            closure(decodeData)
        }
        
        task.resume()
    }
    
    
    func getMonthStat(closure: @escaping (_ stat: [MonthStatModel]?) -> ()){
        let token = UserDefaults.standard.string(forKey: "token")
        
        let parameters = "{\n  \"token\": \"\(token ?? "")\"\n}"
        let postData = parameters.data(using: .utf8)
        
        var request = URLRequest(url: URL(string: "http://185.181.9.137:8888/api/get_six_month_stat")!,timeoutInterval: Double.infinity)
        request.addValue("application/json", forHTTPHeaderField: "accept")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.httpMethod = "POST"
        request.httpBody = postData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                return closure(nil)
            }
            
            let decodeData = try? JSONDecoder().decode([MonthStatModel].self, from: data)
            closure(decodeData)
        }
        
        task.resume()
    }
    
}
