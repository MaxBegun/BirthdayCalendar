import UIKit

final class BDayListTableViewCell: UITableViewCell {
    // MARK: Private
    private let nameLabel = UILabel()
    private let phoneNumberLabel = UILabel()
    private let birthDateLabel = UILabel()
    private let willTurnsLabel = UILabel()
    private let yearsOldLabel = UILabel()
    private let personImageView = UIImageView()
    private let calendar = Calendar(identifier: .gregorian)
    private let dateFormatter = DateFormatter()
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setUpUI()
        addConstraints()
        setUpDateFormatter()
    }
    // MARK: - Setups
    private func addSubviews() {
        contentView.addSubviews(
            nameLabel,
            phoneNumberLabel,
            willTurnsLabel,
            birthDateLabel,
            yearsOldLabel,
            personImageView
        )
    }
    
    private func setUpUI() {
        //cell
        self.backgroundColor = .clear
        self.selectionStyle = .none
        self.dropShadow(radius: 4, opacity: 0.4)
        contentView.layer.cornerRadius = 12
        contentView.layer.borderWidth = .zero
        contentView.backgroundColor = .white
        //nameLabel
        nameLabel.textAlignment = .left
        nameLabel.font = .systemFont(ofSize: 30, weight: .semibold)
        nameLabel.textColor = AppColor.itemColor
        //phoneNumberLabel
        phoneNumberLabel.textAlignment = .left
        phoneNumberLabel.font = .systemFont(ofSize: 13, weight: .semibold)
        phoneNumberLabel.textColor = .lightGray
        //willTurnsLabel
        willTurnsLabel.textAlignment = .right
        willTurnsLabel.font = .systemFont(ofSize: 35, weight: .bold)
        willTurnsLabel.textColor = AppColor.itemColor
        //birthDateLabel
        birthDateLabel.textAlignment = .left
        birthDateLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        birthDateLabel.textColor = .lightGray
        //yearsOldLabel
        yearsOldLabel.textAlignment = .right
        yearsOldLabel.font = .systemFont(ofSize: 18, weight: .semibold)
        yearsOldLabel.textColor = .lightGray
        yearsOldLabel.text = "Turns:"
        //personImageView
        personImageView.roundedImage()
    }
    
    private func addConstraints() {
        //nameLabel
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: personImageView.trailingAnchor, constant: 16).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        //phoneNumberLabel
        phoneNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneNumberLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        phoneNumberLabel.leadingAnchor.constraint(equalTo: personImageView.trailingAnchor, constant: 16).isActive = true
        phoneNumberLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        phoneNumberLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        //birthDateLabel
        birthDateLabel.translatesAutoresizingMaskIntoConstraints = false
        birthDateLabel.topAnchor.constraint(equalTo: phoneNumberLabel.bottomAnchor, constant: 16).isActive = true
        birthDateLabel.leadingAnchor.constraint(equalTo: personImageView.trailingAnchor, constant: 16).isActive = true
        birthDateLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        birthDateLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        //willTurnsLabel
        willTurnsLabel.translatesAutoresizingMaskIntoConstraints = false
        willTurnsLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        willTurnsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        willTurnsLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        willTurnsLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        //yearsOldLabel
        yearsOldLabel.translatesAutoresizingMaskIntoConstraints = false
        yearsOldLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        yearsOldLabel.trailingAnchor.constraint(equalTo: willTurnsLabel.leadingAnchor).isActive = true
        yearsOldLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        yearsOldLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        //personImageView
        personImageView.translatesAutoresizingMaskIntoConstraints = false
        personImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        personImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        personImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        personImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    private func setUpDateFormatter() {
        dateFormatter.dateStyle = .medium
        dateFormatter.dateFormat = "d MMMM"
    }
    //MARK: - API
    func setUpCell(_ model: Person) {
        nameLabel.text = model.name
        phoneNumberLabel.text = model.phoneNumber
        birthDateLabel.text = dateFormatter.string(from: model.birthDate)
        willTurnsLabel.text = String(calendar.numberOfYearsTurns(model.birthDate))
        personImageView.image = model.personImage
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
