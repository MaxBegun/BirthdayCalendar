import UIKit

extension UIImageView {
    func roundedImage() {
        self.contentMode = .scaleAspectFill
        self.clipsToBounds = true
    }
}
