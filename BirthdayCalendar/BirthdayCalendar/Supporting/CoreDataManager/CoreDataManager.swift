import UIKit
import CoreData

final class CoreDataManager {
    static let instance = CoreDataManager()
    
    func savePerson(_ user: Person) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        guard let entity = NSEntityDescription.entity(forEntityName: "PersonEntity", in: managedContext) else { return }
        
        let person = NSManagedObject(entity: entity, insertInto: managedContext)
        let imageData = user.personImage.pngData()
        
        person.setValue(user.name, forKey: "name")
        person.setValue(user.phoneNumber, forKey: "phoneNumber")
        person.setValue(user.birthDate, forKey: "birthDate")
        person.setValue(imageData, forKey: "personImage")
        
        do {
           try managedContext.save()
            print("Saved")
        } catch let error as NSError {
            print("Error - \(error)")
        }
    }
    
    func getPersons() -> [Person]? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return nil }
        
        let managedContext = appDelegate.persistentContainer.viewContext

        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "PersonEntity")
        
        do {
            let objects = try managedContext.fetch(fetchRequest)
            var users = [Person]()
            for object in objects {
                guard let name = object.value(forKey: "name") as? String,
                      let phoneNumber = object.value(forKey: "phoneNumber") as? String,
                      let birthDate = object.value(forKey: "birthDate") as? Date,
                      let imageData = object.value(forKey: "personImage") as? Data
                else { return nil }
                if let personImage = UIImage(data: imageData) {
                    let user = Person(name: name, phoneNumber: phoneNumber, birthDate: birthDate, personImage: personImage)
                    users.append(user)
                }
            }
            return users
        } catch let error as NSError {
            print("Error - \(error)")
        }
        
        return nil
    }
    
    func removePerson(_ indexPath: Int) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "PersonEntity")
        
        do {
            let objects = try managedContext.fetch(fetchRequest)
            managedContext.delete(objects[indexPath])
            print("Deleted")
            try managedContext.save()
        } catch let error as NSError {
            print("Error - \(error)")
        }
    }
    
    private init() { }
}

