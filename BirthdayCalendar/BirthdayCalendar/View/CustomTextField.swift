import UIKit

final class CustomTextField: UIView {
    // MARK: Public
    var birthDate = Date()
    let mainTextField = UITextField()
    var text: String {
        get { mainTextField.text ?? "" }
        set { mainTextField.text = newValue }
    }
    // MARK: Private
    private let imageView = UIImageView()
    private let dateFormatter = DateFormatter()
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupUI()
        addConstraints()
        setDateFormatter()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Setups
    func setKeyboardType(_ type: UIKeyboardType) {
        mainTextField.keyboardType = type
    }
    
    func setPlaceholder(_ placeholder: String) {
        mainTextField.placeholder = placeholder
    }
    
    func setImageView(_ symbolSystemName: String) {
        let configurator = UIImage.SymbolConfiguration(
            pointSize: 40,
            weight: .bold,
            scale: .large)
        
        imageView.image = UIImage(systemName: symbolSystemName, withConfiguration: configurator)
        imageView.tintColor = AppColor.itemColor
    }
    
    func addInputView() {
        mainTextField.setInputView(target: self, selector: #selector(saveDateTapped))
    }
    
    private func setDateFormatter() {
        dateFormatter.dateStyle = .medium
        dateFormatter.dateFormat = "yyyy-MM-dd"
    }
    
    private func addSubviews() {
        addSubviews(mainTextField, imageView)
    }
    
    private func setupUI() {
        layer.cornerRadius = 15
        layer.borderWidth = 1
        layer.borderColor = AppColor.itemColor.cgColor
    }
    
    private func addConstraints() {
        mainTextField.translatesAutoresizingMaskIntoConstraints = false
        mainTextField.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        mainTextField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
        mainTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        mainTextField.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 8).isActive = true
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    @objc private func saveDateTapped() {
        if let datePicker = mainTextField.inputView as? UIDatePicker {
            mainTextField.text = dateFormatter.string(from: datePicker.date)
            birthDate = datePicker.date
        }
        mainTextField.resignFirstResponder()
    }
}
