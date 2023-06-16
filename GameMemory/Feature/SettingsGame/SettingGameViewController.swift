//
//  SettingGameViewController.swift
//  GameMemory
//
//  Created by Douglas  Rodrigues  on 15/05/23.
//

import UIKit

protocol SettingGameViewControllerDelegate: AnyObject {
    func resetMatch()
}

class SettingGameViewController: UIViewController {
    
    // MARK: - Properties
    
    let settingGameView = SettingGameView()
    let viewModel: SettingGameViewModel
    weak var delegate: SettingGameViewControllerDelegate?
    
    override func loadView() {
        view = settingGameView
    }
    
    init(viewModel: SettingGameViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingGameView.delegate = self
    }
    
    // MARK: - Functions
    
    private func showAlert(title: String, text: String, buttonText: String) {
        let alert = UIAlertController(title: title, message: text, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonText, style: .default))
        self.present(alert, animated: true)
    }
}

// MARK: - SettingGameViewProtocol

extension SettingGameViewController: SettingGameViewDelegate {
    
    func clickResetButton() {
        viewModel.resetResultMatch()
        delegate?.resetMatch()
    }
    
    func clickSaveButtonScreen(button: String) {
        if button == "0" || button == "" {
            showAlert(title: "Aviso",
                      text: "Número Inválido",
                      buttonText: "Ok")
        } else {
            viewModel.saveButtonAmount(value: button)
            dismiss(animated: true)
        }
    }
}
