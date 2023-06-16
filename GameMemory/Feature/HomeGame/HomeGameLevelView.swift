//
//  HomeGameLevelView.swift
//  GameMemory
//
//  Created by Douglas  Rodrigues  on 16/05/23.
//

import UIKit

class HomeGameLevelView: UIView {
    
    // MARK: - Properties
    
    private lazy var titleElementsGame: UILabel = {
        let label = UILabel()
        label.text = "Elementos:"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        return label
    }()
    
    lazy var valueElementsGame: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        return label
    }()
    
    private lazy var titleLevelGame: UILabel = {
        let label = UILabel()
        label.text = "Nível:"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        return label
    }()
    
    lazy var valueLevelGame: UILabel = {
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
    
    lazy var valueTimeGame: UILabel = {
        let label = UILabel()
        label.text = "00:00:00"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        return label
    }()
    
    private lazy var elementsStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleElementsGame, valueElementsGame])
        stack.axis = .horizontal
        stack.spacing = 5
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var levelStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLevelGame, valueLevelGame])
        stack.axis = .horizontal
        stack.spacing = 5
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var timeStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleTimeGame, valueTimeGame])
        stack.axis = .horizontal
        stack.spacing = 5
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var fatherStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [elementsStack, levelStack, timeStack])
        stack.axis = .vertical
        stack.spacing = 5
        stack.alignment = .leading
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    
    private func setupViews() {
        addSubview(fatherStack)
        
        NSLayoutConstraint.activate([
            fatherStack.topAnchor.constraint(equalTo: topAnchor),
            fatherStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            fatherStack.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
