//
//  HomeGameView.swift
//  GameMemory
//
//  Created by Douglas  Rodrigues  on 25/04/23.
//

import UIKit

protocol HomeGameViewDelegate: AnyObject {
    func clickButtonStartGame()
    func clickButtonConfiguration()
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
    
    private lazy var configuratioButtonGame: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "gear"), for: .normal)
        button.tintColor = .white
        button.contentMode = .scaleAspectFit
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        button.imageEdgeInsets = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
        button.addTarget(self, action: #selector(actionClikcButtonOpenConfiguration), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var homeGameLevelView: HomeGameLevelView = {
        let view = HomeGameLevelView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var buttonStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [startButtonGame])
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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Fuctions
    
    private func setupLayout() {
        addSubview(configuratioButtonGame)
        addSubview(titleGame)
        addSubview(buttonStack)
        addSubview(homeGameLevelView)
        
        NSLayoutConstraint.activate([
            
            configuratioButtonGame.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            configuratioButtonGame.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            titleGame.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleGame.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            homeGameLevelView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            homeGameLevelView.trailingAnchor.constraint(equalTo: trailingAnchor),
            homeGameLevelView.bottomAnchor.constraint(equalTo: buttonStack.topAnchor, constant: -10),
            
            buttonStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            buttonStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            buttonStack.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
        ])
    }
    
    @objc func actionClickButtonStart() {
        delegate?.clickButtonStartGame()
    }
    
    @objc func actionClikcButtonOpenConfiguration() {
        delegate?.clickButtonConfiguration()
    }
    
    func setupData(setup: HomeGameModel?) {
        guard let setup = setup else { return }
        homeGameLevelView.valueElementsGame.text = setup.numberElemts 
        homeGameLevelView.valueLevelGame.text = String(setup.numberAcert)
        homeGameLevelView.valueTimeGame.text = setup.time
    }
}
