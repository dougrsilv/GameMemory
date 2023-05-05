//
//  HomeGameView.swift
//  GameMemory
//
//  Created by Douglas  Rodrigues  on 25/04/23.
//

import UIKit

protocol HomeGameViewDelegate: AnyObject {
    func clickButtonStartGame(value: String)
}

class HomeGameView: UIView {
    
    // MARK: - Properties
    
    weak var delegate: HomeGameViewDelegate?
    
    private lazy var titleGame: UILabel = {
        let label = UILabel()
        label.text = "Jogo da Memória"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var numberOfButtons: UITextField = {
        let text = UITextField()
        text.placeholder = "Digite a quantidade de botões"
        text.backgroundColor = .white
        text.layer.cornerRadius = 10
        text.keyboardType = .numberPad
        text.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: text.frame.height))
        text.leftViewMode = .always
        text.heightAnchor.constraint(equalToConstant: 55).isActive = true
        return text
    }()
    
    private lazy var startButtonGame: UIButton = {
        let button = UIButton()
        button.setTitle("Jogar", for: .normal)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.backgroundColor = .red
        button.tintColor = .white
        button.addTarget(self, action: #selector(actionClickButtonStart), for: .touchUpInside)
        button.heightAnchor.constraint(equalToConstant: 55).isActive = true
        return button
    }()
    
    private lazy var titleLevelGame: UILabel = {
        let label = UILabel()
        label.text = "Último Nível:"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var levelGame: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var buttonStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [numberOfButtons, startButtonGame])
        stack.axis = .vertical
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemCyan
        setupLayout()
        notificationKeyborad()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Fuctions
    
    private func setupLayout() {
        addSubview(titleGame)
        addSubview(buttonStack)
        addSubview(titleLevelGame)
        addSubview(levelGame)
        
        NSLayoutConstraint.activate([
            titleGame.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleGame.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            titleLevelGame.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLevelGame.bottomAnchor.constraint(equalTo: buttonStack.topAnchor, constant: -10),
            
            levelGame.leadingAnchor.constraint(equalTo: titleLevelGame.trailingAnchor, constant: 5),
            levelGame.bottomAnchor.constraint(equalTo: buttonStack.topAnchor, constant: -10),
            
            buttonStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            buttonStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            buttonStack.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
        ])
    }
    
    private func notificationKeyborad() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil);
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil);
    }
    
    @objc func actionClickButtonStart() {
        delegate?.clickButtonStartGame(value: numberOfButtons.text ?? "")
    }
    
    @objc func keyboardWillShow(sender: NSNotification) {
         self.frame.origin.y = -280
    }

    @objc func keyboardWillHide(sender: NSNotification) {
         self.frame.origin.y = 0
    }
    
    func setupData(setup: HomeGameModel?) {
        guard let setup = setup else { return }
        levelGame.text = String(setup.numberAcert)
    }
}
