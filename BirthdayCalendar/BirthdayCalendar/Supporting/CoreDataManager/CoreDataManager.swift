import UIKit
import CoreData

final class CoreDataManager {
    static let instance = CoreDataManager()
    
    func savePerson(_ user: Person) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return}
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "PersonEntity", in: managedContext)!
        
        let person = NSManagedObject(entity: entity, insertInto: managedContext)
        
        person.setValue(user.name, forKey: "name")
        person.setValue(user.phoneNumber, forKey: "phoneNumber")
        person.setValue(user.birthDate, forKey: "birthDate")
        
        do {
           try managedContext.save()
            print("Saved")
        } catch let error as NSError {
            print("Error - \(error)")
        }
    }
    
    func getPerson() -> [Person]? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return nil}
        
        let managedContext = appDelegate.persistentContainer.viewContext

        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "PersonEntity")
        
        do {
            let objects = try managedContext.fetch(fetchRequest)
            var users = [Person]()
            for object in objects {
                guard let name = object.value(forKey: "name") as? String, let phoneNumber = object.value(forKey: "phoneNumber") as? String, let birthDate = object.value(forKey: "birthDate") as? Date else { return nil}
                let user = Person(name: name, phoneNumber: phoneNumber, birthDate: birthDate)
                users.append(user)
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

