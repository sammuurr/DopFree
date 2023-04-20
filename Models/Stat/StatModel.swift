import Foundation

struct WeekStatModel: Codable{
    var Sunday: Double
    var Saturday: Double
    var Friday: Double
    var Thursday: Double
    var Wednesday: Double
    var Tuesday: Double
    var Monday: Double
}

struct MonthStatModel: Codable{
    let month: String
    let percent: Double
}
