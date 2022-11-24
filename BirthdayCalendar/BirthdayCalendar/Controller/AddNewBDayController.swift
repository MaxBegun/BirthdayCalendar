import UIKit

final class AddNewBDayController: UIViewController {
    // MARK: Private
    private let enterInfoLabel = UILabel()
    private let nameTextField = CustomTextField()
    private let phoneNumTextField = CustomTextField()
    private var birthDateTextField = CustomTextField()
    private let saveButton = UIButton()
    private var containerImagesView = UIView()
    private let emojiStackView = UIStackView()
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private var profileImage: UIImage?
    private let imagesArray: [UIImage] = [
        UIImage(named: "first.png")!,
        UIImage(named: "second.png")!,
        UIImage(named: "third.png")!,
        UIImage(named: "forth.png")!,
        UIImage(named: "fifth.png")!,
    ]
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setUpUI()
        addConstraints()
        setUpImageViews()
    }
    // MARK: - Setups
    private func addSubviews() {
        view.addSubviews(
            enterInfoLabel,
            nameTextField,
            phoneNumTextField,
            birthDateTextField,
            saveButton,
            containerImagesView
        )
        containerImagesView.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(emojiStackView)
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
        nameTextField.setImageView("person")
        //phoneNumTextField
        phoneNumTextField.setPlaceholder("Phone number")
        phoneNumTextField.setKeyboardType(.phonePad)
        phoneNumTextField.setImageView("phone")
        //dateTextField
        birthDateTextField.setPlaceholder("Birth date")
        birthDateTextField.setImageView("calendar")
        birthDateTextField.addInputView()
        //saveButton
        saveButton.setTitle("SAVE", for: .normal)
        saveButton.backgroundColor = AppColor.itemColor
        saveButton.layer.cornerRadius = 13
        saveButton.addTarget(self, action: #selector(saveButtonDidTapped), for: .touchUpInside)
        //containerImagesView
        containerImagesView.layer.cornerRadius = 13
        containerImagesView.layer.borderWidth = 1
        containerImagesView.layer.borderColor = AppColor.itemColor.cgColor
        containerImagesView.clipsToBounds = true
        //emojiStackView
        emojiStackView.axis = .horizontal
        emojiStackView.distribution = .fillEqually
        emojiStackView.spacing = 15
        //scrollView
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
    }
    
    private func addConstraints() {
        //enterInfoLabel
        enterInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        enterInfoLabel.topAnchor.constraint(equalTo: containerImagesView.bottomAnchor, constant: 20).isActive = true
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
        //containerImagesView
        containerImagesView.translatesAutoresizingMaskIntoConstraints = false
        containerImagesView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        containerImagesView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        containerImagesView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        containerImagesView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        //scrollView
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: containerImagesView.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: containerImagesView.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: containerImagesView.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: containerImagesView.bottomAnchor).isActive = true
        //contentView
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        //emojiStackView
        emojiStackView.translatesAutoresizingMaskIntoConstraints = false
        emojiStackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        emojiStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        emojiStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        emojiStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    private func setUpImageViews() {
        for image in imagesArray {
            let imageView = UIImageView(image: image)
            let tapRecognizer = UITapGestureRecognizer()
            imageView.roundedImage()
            
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
            imageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
            //imageView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor).isActive = true
            
            imageView.isUserInteractionEnabled = true
            imageView.addGestureRecognizer(tapRecognizer)
            tapRecognizer.addTarget(self, action: #selector(imageTapped))
            
            emojiStackView.addArrangedSubview(imageView)
        }
    }
    // MARK: - Helpers
    @objc private func saveButtonDidTapped() {
        let name = nameTextField.text
        let phoneNumber = phoneNumTextField.text
        let birthDate = birthDateTextField.birthDate
        let birthDateText = birthDateTextField.text
        let personImage = profileImage
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
        } else if personImage == nil {
            alert.message = "Please choose an image"
            present(alert, animated: true, completion: nil)
            return
        }
        
        if let personImage = personImage {
            let person = Person(name: name, phoneNumber: phoneNumber, birthDate: birthDate, personImage: personImage)
            CoreDataManager.instance.savePerson(person)
            NotificationManager.instance.save(name, birthDate)
            navigationController?.popViewController(animated: true)
        }
    }
    
    @objc private func imageTapped(gestureRecognizer: UITapGestureRecognizer) {
        if let tappedImage = gestureRecognizer.view as? UIImageView {
            tappedImage.dropShadow(radius: 5, opacity: 1)
            profileImage = tappedImage.image
        }
    }
}
