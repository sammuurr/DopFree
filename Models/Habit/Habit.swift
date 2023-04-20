import Foundation

class Habit{
    
    func getHabits(closure: @escaping (_ habits: [HabitModel]?) -> ()){
        let token = UserDefaults.standard.string(forKey: "token")
        
        let parameters = "{\n  \"token\": \"\(token ?? "")\"\n}"
        let postData = parameters.data(using: .utf8)
        
        var request = URLRequest(url: URL(string: "http://185.181.9.137:8888/api/get_habits")!,timeoutInterval: Double.infinity)
        request.addValue("application/json", forHTTPHeaderField: "accept")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.httpMethod = "POST"
        request.httpBody = postData
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                return closure(nil)
            }
            
            let decodeData = try? JSONDecoder().decode([HabitApiModel].self, from: data)
            var returnArray: [HabitModel] = []
            
            if decodeData != nil{
                for habit in decodeData!{
                    returnArray.append(HabitModel(apID: habit.id,
                                                  name: habit.name,
                                                  description: habit.description,
                                                  imageName: habit.image,
                                                  minDescp: habit.min_description,
                                                  streak: habit.streak,
                                                  completed: habit.completed
                                                 )
                    )
                }
            }
            closure(returnArray)
            
        }.resume()
    }
    
    
    func completeHabit(id: String, closure: @escaping (_ habits: Bool) -> ()){
        let token = UserDefaults.standard.string(forKey: "token")
        
        let parameters = "{\n  \"token\": \"\(token ?? "")\",\n  \"id\": \(id)\n}"
        let postData = parameters.data(using: .utf8)
        
        var request = URLRequest(url: URL(string: "http://185.181.9.137:8888/api/complete_habit")!,timeoutInterval: Double.infinity)
        request.addValue("application/json", forHTTPHeaderField: "accept")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.httpMethod = "POST"
        request.httpBody = postData
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if data == nil {
                return closure(false)
            }
            
            if self.checkStatusCode(response: response){
                closure(true)
            }else{
                closure(false)
            }
        }.resume()
    }
    
    
    func addHabit(name: String, description: String, min_description: String, closure: @escaping (_ success: Bool) -> ()){
        let token = UserDefaults.standard.string(forKey: "token")
        
        let parameters = "{\n  \"token\": \"\(token ?? "")\",\n  \"name\": \"\(name)\",\n  \"description\": \"\(description)\",\n  \"min_description\": \"\(min_description)\",\n  \"image\": \"other_icon_155053\",\n  \"streak\": 0\n}"
        let postData = parameters.data(using: .utf8)
        
        var request = URLRequest(url: URL(string: "http://185.181.9.137:8888/api/add_habit")!,timeoutInterval: Double.infinity)
        request.addValue("application/json", forHTTPHeaderField: "accept")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.httpMethod = "POST"
        request.httpBody = postData
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if data == nil {
                return closure(false)
            }
            
            if self.checkStatusCode(response: response){
                closure(true)
            }else{
                closure(false)
            }
        }.resume()
    }
    
    
    private func checkStatusCode(response:URLResponse?) -> Bool {
        guard let statusCode = (response as? HTTPURLResponse)?.statusCode else {
            print("Invalid Response")
            return false
        }
        
        if statusCode != 200 {
            print("Invalid File")
            return false
        }
        return true
    }
}

