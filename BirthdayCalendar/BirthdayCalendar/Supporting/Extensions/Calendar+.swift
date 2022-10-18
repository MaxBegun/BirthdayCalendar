import Foundation

extension Calendar {

    func numberOfYearsTurns(_ birthDate: Date) -> Int {
        let currentDate = Date()
        let numberOfYears = dateComponents([.year], from: currentDate, to: birthDate)
            
        return -numberOfYears.year! + 1
    }
}
