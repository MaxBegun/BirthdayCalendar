import UIKit

extension UIView {
    func dropShadow(radius: CGFloat, opacity: Float, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = AppColor.itemColor.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = .zero
        layer.shadowRadius = radius
        
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    func addSubviews(_ views: UIView...) {
        views.forEach(addSubview)
    }
}
