import Foundation

extension Calendar {
    func numberOfYearsTurns(_ birthDate: Date) -> Int {
        let currentDate = Date()
        let numberOfYears = dateComponents([.year], from: currentDate, to: birthDate)
        var result = 0
        
        if let numOfYears = numberOfYears.year {
            result = -numOfYears + 1
        }
        return result
    }
}
