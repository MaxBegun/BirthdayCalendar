import UIKit

final class BDayListTableViewCell: UITableViewCell {
    // MARK: - Properties
    // MARK: Public
    public let nameLabel = UILabel()
    public let phoneNumberLabel = UILabel()
    public let birthDateLabel = UILabel()
    public let willTurnsLabel = UILabel()
    public let yearsOldLabel = UILabel()
    // MARK: Private
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setUpUI()
        addConstraints()
    }
    // MARK: - Setups
    private func addSubviews() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(phoneNumberLabel)
        contentView.addSubview(willTurnsLabel)
        contentView.addSubview(birthDateLabel)
        contentView.addSubview(yearsOldLabel)
    }
    
    private func setUpUI() {
        //cell
        self.backgroundColor = .clear
        self.selectionStyle = .none
        self.dropShadow()
        contentView.layer.cornerRadius = 12
        contentView.layer.masksToBounds = true
        contentView.layer.borderWidth = .zero
        contentView.backgroundColor = .white
        //nameLabel
        nameLabel.textAlignment = .left
        nameLabel.font = .systemFont(ofSize: 30, weight: .semibold)
        nameLabel.textColor = AppColor.itemColor
        //phoneNumberLabel
        phoneNumberLabel.textAlignment = .left
        phoneNumberLabel.font = .systemFont(ofSize: 15, weight: .semibold)
        phoneNumberLabel.textColor = .lightGray
        //willTurnsLabel
        willTurnsLabel.textAlignment = .right
        willTurnsLabel.font = .systemFont(ofSize: 45, weight: .bold)
        willTurnsLabel.textColor = AppColor.itemColor
        //birthDateLabel
        birthDateLabel.textAlignment = .left
        birthDateLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        birthDateLabel.textColor = .lightGray
        //yearsOldLabel
        yearsOldLabel.textAlignment = .right
        yearsOldLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        yearsOldLabel.textColor = .lightGray
        yearsOldLabel.text = "Turns:"
    }
    
    private func addConstraints() {
        //nameLabel
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        //phoneNumberLabel
        phoneNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneNumberLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        phoneNumberLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        phoneNumberLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        phoneNumberLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        //birthDateLabel
        birthDateLabel.translatesAutoresizingMaskIntoConstraints = false
        birthDateLabel.topAnchor.constraint(equalTo: phoneNumberLabel.bottomAnchor, constant: 16).isActive = true
        birthDateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        birthDateLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        birthDateLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        //willTurnsLabel
        willTurnsLabel.translatesAutoresizingMaskIntoConstraints = false
        willTurnsLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        willTurnsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        willTurnsLabel.widthAnchor.constraint(equalToConstant: 80).isActive = true
        willTurnsLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        //yearsOldLabel
        yearsOldLabel.translatesAutoresizingMaskIntoConstraints = false
        yearsOldLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        yearsOldLabel.trailingAnchor.constraint(equalTo: willTurnsLabel.leadingAnchor).isActive = true
        yearsOldLabel.widthAnchor.constraint(equalToConstant: 80).isActive = true
        yearsOldLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
