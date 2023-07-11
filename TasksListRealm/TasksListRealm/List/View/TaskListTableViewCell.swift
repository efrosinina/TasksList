//
//  TaskListTableViewCell.swift
//  TasksListRealm
//
//  Created by Елизавета Ефросинина on 09/07/2023.
//

import UIKit
import SnapKit

class TaskListTableViewCell: UITableViewCell {
    //MARK: -- GUI Variables
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = randomColor
        label.font = .boldSystemFont(ofSize: 15)
        
        return label
    }()
    
    //MARK: -- Properties
    private let randomColor = RandomColor().color
    
    //MARK: -- Initiaization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: -- Private Methods
    private func configureUI() {
        addSubview(titleLabel)
        backgroundColor = randomColor.withAlphaComponent(0.2)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(20)
        }
    }
}
