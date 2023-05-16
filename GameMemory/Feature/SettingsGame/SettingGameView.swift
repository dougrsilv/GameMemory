//
//  SettingGameView.swift
//  GameMemory
//
//  Created by Douglas  Rodrigues  on 16/05/23.
//

import UIKit

protocol SettingGameViewProtocol: AnyObject {
    func clickSaveButtonScreen(button: String)
    func clickResetButton()
}

class SettingGameView: UIView {
    
    // MARK: - Properties
    
    weak var delegate: SettingGameViewProtocol?
    
    private lazy var titleSettingGame: UILabel = {
        let label = UILabel()
        label.text = "Configuração"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var titleSaveSettingGame: UILabel = {
        let label = UILabel()
        label.text = "Quantidade de Botões:"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
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
    
    private lazy var saveButtonGame: UIButton = {
        let button = UIButton()
        button.setTitle("Salvar Botões", for: .normal)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.backgroundColor = .red
        button.tintColor = .white
        button.addTarget(self, action: #selector(actionClickButtonSave), for: .touchUpInside)
        button.heightAnchor.constraint(equalToConstant: 55).isActive = true
        return button
    }()
    
    private lazy var titleResetSettingGame: UILabel = {
        let label = UILabel()
        label.text = "Reset Nível:"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var resetButtonGame: UIButton = {
        let button = UIButton()
        button.setTitle("Reset", for: .normal)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.backgroundColor = .red
        button.tintColor = .white
        button.addTarget(self, action: #selector(actionClickButtonReset), for: .touchUpInside)
        button.heightAnchor.constraint(equalToConstant: 55).isActive = true
        return button
    }()
    
    private lazy var buttonResetStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleResetSettingGame, resetButtonGame])
        stack.axis = .vertical
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var buttonSaveStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleSaveSettingGame, numberOfButtons, saveButtonGame])
        stack.axis = .vertical
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        notificationKeyborad()
        backgroundColor = .systemCyan
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    
    func setupViews() {
        addSubview(titleSettingGame)
        addSubview(buttonResetStack)
        addSubview(buttonSaveStack)
        
        NSLayoutConstraint.activate([
            titleSettingGame.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            titleSettingGame.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            buttonResetStack.topAnchor.constraint(equalTo: titleSettingGame.bottomAnchor, constant: 70),
            buttonResetStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            buttonResetStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            buttonSaveStack.topAnchor.constraint(equalTo: buttonResetStack.bottomAnchor, constant: 30),
            buttonSaveStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            buttonSaveStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        ])
    }
    
    private func notificationKeyborad() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil);
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil);
    }
    
    @objc func keyboardWillShow(sender: NSNotification) {
         self.frame.origin.y = 0
    }

    @objc func keyboardWillHide(sender: NSNotification) {
         self.frame.origin.y = 0
    }
    
    @objc func actionClickButtonSave() {
        delegate?.clickSaveButtonScreen(button: numberOfButtons.text ?? "")
    }
    
    @objc func actionClickButtonReset() {
        delegate?.clickResetButton()
    }
}
