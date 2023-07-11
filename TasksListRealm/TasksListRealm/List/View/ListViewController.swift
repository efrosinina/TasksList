//
//  ListViewController.swift
//  TasksListRealm
//
//  Created by Елизавета Ефросинина on 09/07/2023.
//

import UIKit
import SnapKit
import RealmSwift

class ListViewController: UITableViewController {
    //MARK: -- GUI Variables
    private lazy var addButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.image = UIImage(systemName: "plus")
        configuration.cornerStyle = .capsule
        configuration.buttonSize = .large
        let button = UIButton(configuration: configuration)
        button.addTarget(self, action: #selector(addTask), for: .touchUpInside)
        
        return button
    }()
    
    //MARK: -- Properties
    var items: Results<TaskList>?
    
    //MARK: -- Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        items = realm.objects(TaskList.self)
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    //MARK: -- Initialization
    init() {
        super.init(style: .insetGrouped)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: -- Private Methods
    private func configureUI() {
        view.backgroundColor = .white
        title = "Tasks List"
        navigationController?.view.addSubview(addButton)
        navigationController?.navigationBar.prefersLargeTitles = true
        setupConstraints()
        configureTableView()
    }
    
    
    private func configureTableView() {
        tableView.register(TaskListTableViewCell.self, forCellReuseIdentifier: "TaskListTableViewCell")
        tableView.separatorStyle = .none
    }
    
    private func setupConstraints() {
        addButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(40)
        }
    }
    
    @objc
    private func addTask() {
        let controller = TaskViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
}

//MARK: -- UITableViewDataSource && UITableViewdelegate
extension ListViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return items?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TaskListTableViewCell", for: indexPath) as? TaskListTableViewCell else { return UITableViewCell() }
        
        let item = items?[indexPath.section]
        cell.titleLabel.text = item?.task
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete){
            guard let item = items?[indexPath.row] else { return }
            RealmManager.deleteTask(item)
            tableView.reloadData()
        }
    }
}
