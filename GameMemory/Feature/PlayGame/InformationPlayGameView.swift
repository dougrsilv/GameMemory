//
//  InformationPlayGameView.swift
//  GameMemory
//
//  Created by Douglas  Rodrigues  on 15/05/23.
//

import UIKit

class InformationPlayGameView: UIView {
    
    // MARK: - Properties
    
    private lazy var titleLevelGame: UILabel = {
        let label = UILabel()
        label.text = "Nível:"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        return label
    }()
    
    lazy var LevelGame: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        return label
    }()
    
    private lazy var titleRecordGame: UILabel = {
        let label = UILabel()
        label.text = "Recorde:"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        return label
    }()
    
    lazy var recordGame: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        return label
    }()
    
    private lazy var titleTimeGame: UILabel = {
        let label = UILabel()
        label.text = "Tempo:"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        return label
    }()
    
    lazy var timeGame: UILabel = {
        let label = UILabel()
        label.text = "00:00:00"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        return label
    }()
    
    private lazy var stacklevel: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLevelGame, LevelGame])
        stack.spacing = 5
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var stackRecord: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleRecordGame, recordGame])
        stack.spacing = 5
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var stackTime: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleTimeGame, timeGame])
        stack.spacing = 5
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var stackFather: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [stacklevel, stackRecord, stackTime])
        stack.axis = .vertical
        stack.spacing = 2
        stack.alignment = .leading
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    
    private func setupLayout() {
        
        addSubview(stackFather)
        
        NSLayoutConstraint.activate([
            stackFather.topAnchor.constraint(equalTo: topAnchor),
            stackFather.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
        ])
    }
}
