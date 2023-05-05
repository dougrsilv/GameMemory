//
//  PlayGameView.swift
//  GameMemory
//
//  Created by Douglas  Rodrigues  on 25/04/23.
//

import UIKit

protocol PlayGameViewDelegate: AnyObject {
    func clickButtonOption()
    func clickSelectCorrectButton(number: Int)
}

class PlayGameView: UIView {
    
    // MARK: - Properties
    
    weak var delegate: PlayGameViewDelegate?
    
    private lazy var titleGame: UILabel = {
        let label = UILabel()
        label.text = "Jogo"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var optionPlayGame: UIButton = {
        let button = UIButton()
        button.setTitle("Opções", for: .normal)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.backgroundColor = .red
        button.tintColor = .white
        button.addTarget(self, action: #selector(actionClickButtonOption), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var titleLevelGame: UILabel = {
        let label = UILabel()
        label.text = "Nível:"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var LevelGame: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var buttonsGameView: ButtonsGameView = {
        let buttonsGameView = ButtonsGameView()
        buttonsGameView.delegate = self
        buttonsGameView.translatesAutoresizingMaskIntoConstraints = false
        return buttonsGameView
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemCyan
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    
    private func setupLayout() {
        addSubview(optionPlayGame)
        addSubview(titleGame)
        addSubview(titleLevelGame)
        addSubview(LevelGame)
        addSubview(buttonsGameView)
        
        NSLayoutConstraint.activate([
            titleGame.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            titleGame.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            optionPlayGame.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            optionPlayGame.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            optionPlayGame.heightAnchor.constraint(equalToConstant: 55),
            
            titleLevelGame.topAnchor.constraint(equalTo: optionPlayGame.bottomAnchor, constant: 10),
            titleLevelGame.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            LevelGame.topAnchor.constraint(equalTo: optionPlayGame.bottomAnchor, constant: 10),
            LevelGame.leadingAnchor.constraint(equalTo: titleLevelGame.trailingAnchor, constant: 5),
            
            buttonsGameView.topAnchor.constraint(equalTo: optionPlayGame.bottomAnchor, constant: 50),
            buttonsGameView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            buttonsGameView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            buttonsGameView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    @objc func actionClickButtonOption() {
        delegate?.clickButtonOption()
    }
}

extension PlayGameView: ButtonsGameViewDelegate {
    func selectButtonNumber(number: Int) {
        delegate?.clickSelectCorrectButton(number: number)
    }
}
