import Foundation

final class Person {
    let name: String
    let phoneNumber: String
    let birthDate: Date
    
    init(name: String, phoneNumber: String, birthDate: Date) {
        self.name = name
        self.phoneNumber = phoneNumber
        self.birthDate = birthDate
    }
}
