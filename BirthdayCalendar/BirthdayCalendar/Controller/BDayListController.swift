import UIKit

final class BDayListController: UIViewController {
    // MARK: Private
    private let bDayListTableView = UITableView()
    private var bDayList = [Person]() {
        didSet {
            bDayListTableView.reloadData()
        }
    }
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setUpUI()
        addConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard let persons = CoreDataManager.instance.getPersons() else { return }
        bDayList = persons
    }
    // MARK: - Setups
    private func addSubviews() {
        view.addSubviews(bDayListTableView)
    }
    
    private func setUpUI() {
        view.backgroundColor = AppColor.backgroundColor
        //navigationBar
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Birthday List"
        //rightBarButtonItem
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewBDay))
        navigationItem.rightBarButtonItem?.tintColor = AppColor.itemColor
        //tableView
        bDayListTableView.delegate = self
        bDayListTableView.dataSource = self
        bDayListTableView.clipsToBounds = false
        bDayListTableView.backgroundColor = .clear
        bDayListTableView.separatorColor = .clear
        bDayListTableView.register(BDayListTableViewCell.self, forCellReuseIdentifier: "BDayListTableViewCell")
    }
    
    private func addConstraints() {
        bDayListTableView.translatesAutoresizingMaskIntoConstraints = false
        bDayListTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        bDayListTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        bDayListTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        bDayListTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
    }
    
    @objc private func addNewBDay() {
        let addNewBdayVC = AddNewBDayController()
        navigationController?.pushViewController(addNewBdayVC, animated: true)
    }
    // MARK: - Helpers
}
extension BDayListController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return bDayList.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UILabel()
        header.backgroundColor = .clear
        
        return header
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    //cell deleating
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete
        {
            bDayList.remove(at: indexPath.section)
            bDayListTableView.reloadData()
            CoreDataManager.instance.removePerson(indexPath.section)
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "BDayListTableViewCell", for: indexPath) as?
            BDayListTableViewCell {
            cell.setUpCell(bDayList[indexPath.section])
            
            return cell
        }
        return UITableViewCell()
    }
}
