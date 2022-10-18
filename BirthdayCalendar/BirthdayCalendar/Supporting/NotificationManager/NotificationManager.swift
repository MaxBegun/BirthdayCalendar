import Foundation
import UserNotifications

struct NotificationManager {
    static let instance = NotificationManager()
    
    func save(_ name: String,_ date: Date) {
        let content = UNMutableNotificationContent()
        content.body = "Today  is \(name)'s birthday!"
        content.sound = .default
        
        var dateComponents = Calendar.current.dateComponents([.month, .day], from: date)
        dateComponents.hour = 09
        dateComponents.minute = 00
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let request = UNNotificationRequest(identifier: "id", content: content, trigger: trigger)
        let center = UNUserNotificationCenter.current()
        center.add(request)
    }
}

