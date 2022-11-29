import Foundation
import UIKit

final class Person {
    let name: String
    let phoneNumber: String
    let birthDate: Date
    let personImage: UIImage
    
    init(name: String, phoneNumber: String, birthDate: Date, personImage: UIImage) {
        self.name = name
        self.phoneNumber = phoneNumber
        self.birthDate = birthDate
        self.personImage = personImage
    }
}
