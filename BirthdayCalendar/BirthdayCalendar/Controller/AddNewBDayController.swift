import UIKit

final class AddNewBDayController: UIViewController {
    // MARK: - Properties
    // MARK: Public
    // MARK: Private
    private let enterInfoLabel = UILabel()
    private let nameTextField = CustomTextField()
    private let phoneNumTextField = CustomTextField()
    private var birthDateTextField = CustomTextField()
    private let saveButton = UIButton()
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setUpUI()
        addConstraints()
    }
    // MARK: - Setups
    private func addSubviews() {
        view.addSubviews(enterInfoLabel, nameTextField, phoneNumTextField, birthDateTextField, saveButton)
    }
    
    private func setUpUI() {
        view.backgroundColor = AppColor.backgroundColor
        //navigation controller
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Add BDay"
        //enterInfoLabel
        enterInfoLabel.textAlignment = .center
        enterInfoLabel.text = "Enter information below:"
        enterInfoLabel.font = .systemFont(ofSize: 23, weight: .medium)
        enterInfoLabel.textColor = .lightGray
        //nameTextField
        nameTextField.setPlaceholder("Name")
        nameTextField.setKeyboardType(.namePhonePad)
        nameTextField.isAutocorrectionEnabled = false
        nameTextField.setImageView("person")
        //phoneNumTextField
        phoneNumTextField.setPlaceholder("Phone number")
        phoneNumTextField.setKeyboardType(.phonePad)
        phoneNumTextField.isAutocorrectionEnabled = false
        phoneNumTextField.setImageView("phone")
        //dateTextField
        birthDateTextField.setPlaceholder("Birth date")
        birthDateTextField.setImageView("calendar")
        birthDateTextField.addInputView()
        //saveButton
        saveButton.setTitle("SAVE", for: .normal)
        //saveButton.setTitleColor(UIColor.init(white: 1, alpha: 0.3), for: .highlighted)
        saveButton.backgroundColor = AppColor.itemColor
        saveButton.layer.cornerRadius = 13
        saveButton.addTarget(self, action: #selector(saveButtonDidTapped), for: .touchUpInside)
    }
    
    private func addConstraints() {
        //enterInfoLabel
        enterInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        enterInfoLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        enterInfoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        enterInfoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        enterInfoLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        //nameTextField
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.topAnchor.constraint(equalTo: enterInfoLabel.bottomAnchor, constant: 20).isActive = true
        nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 70).isActive = true
        //surnameTextField
        phoneNumTextField.translatesAutoresizingMaskIntoConstraints = false
        phoneNumTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20).isActive = true
        phoneNumTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        phoneNumTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        phoneNumTextField.heightAnchor.constraint(equalToConstant: 70).isActive = true
        //birthDateTextField
        birthDateTextField.translatesAutoresizingMaskIntoConstraints = false
        birthDateTextField.topAnchor.constraint(equalTo: phoneNumTextField.bottomAnchor, constant: 20).isActive = true
        birthDateTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        birthDateTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        birthDateTextField.heightAnchor.constraint(equalToConstant: 70).isActive = true
        //saveButton
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        saveButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        saveButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        saveButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    // MARK: - Helpers
    @objc private func saveButtonDidTapped() {
        let name = nameTextField.text
        let phoneNumber = phoneNumTextField.text
        let birthDate = birthDateTextField.birthDate
        let birthDateText = birthDateTextField.text
        //addAlert
        let alert = UIAlertController(title: "Error!", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { _ in
            self.dismiss(animated: true, completion: nil)
        }))
        if name.isEmpty {
            alert.message = "Please enter name"
            present(alert, animated: true, completion: nil)
            return
        } else if phoneNumber.isEmpty {
            alert.message = "Please enter phone number"
            present(alert, animated: true, completion: nil)
            return
        } else if birthDateText.isEmpty {
            alert.message = "Please enter birth date"
            present(alert, animated: true, completion: nil)
            return
        }
        
        let person = Person(name: name, phoneNumber: phoneNumber, birthDate: birthDate)
        CoreDataManager.instance.savePerson(person)
        NotificationManager.instance.save(name, birthDate)
        navigationController?.popViewController(animated: true)
    }
}
