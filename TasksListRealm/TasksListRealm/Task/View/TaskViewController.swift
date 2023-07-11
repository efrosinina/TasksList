//
//  TaskViewController.swift
//  TasksListRealm
//
//  Created by Елизавета Ефросинина on 09/07/2023.
//

import UIKit
import SnapKit
import RealmSwift

class TaskViewController: UIViewController {
    //MARK: -- GUI Variables
    private lazy var descriptionTask: UITextField = {
        let task = UITextField()
        task.backgroundColor = .tertiarySystemBackground
        task.layer.cornerRadius = 15
        task.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
        task.leftViewMode = .always
        task.placeholder = "Text for your task"
        task.font = .boldSystemFont(ofSize: 20)
        task.returnKeyType = .done
        
        return task
    }()
    
    private lazy var saveButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.cornerStyle = .large
        var container = AttributeContainer()
        container.font = .boldSystemFont(ofSize: 20)
        configuration.attributedTitle = AttributedString("Save", attributes: container)
        let button = UIButton(configuration: configuration)
        button.addTarget(self, action: #selector(saveTask), for: .touchUpInside)
        
        return button
    }()
    
    //MARK: -- Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    //MARK: -- Private Methods
    private func configureUI() {
        view.backgroundColor = .systemGroupedBackground
        view.addSubviews([descriptionTask, saveButton])
        descriptionTask.becomeFirstResponder()
        setupConstraints()
    }
    
    private func setupConstraints() {
        descriptionTask.snp.makeConstraints {
            $0.trailing.leading.equalToSuperview().inset(20)
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.height.equalTo(60)
        }
        
        saveButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(descriptionTask.snp.bottom).offset(10)
            $0.height.equalTo(60)
        }
    }
    
    @objc
    private func saveTask() {
        guard let text = descriptionTask.text else { return }
        RealmManager.saveTask(task: text)
        navigationController?.popToRootViewController(animated: true)
    }
}
