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
    let viewmodel = SettingGameViewModel()
    weak var delegate: SettingGameViewControllerDelegate?
    
    override func loadView() {
        view = settingGameView
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

extension SettingGameViewController: SettingGameViewProtocol {
    
    func clickResetButton() {
        viewmodel.resetResultMatch()
        delegate?.resetMatch()
    }
    
    func clickSaveButtonScreen(button: String) {
        if button == "0" || button == "" {
            showAlert(title: "Aviso",
                      text: "Número Inválido",
                      buttonText: "Ok")
        } else {
            viewmodel.saveButtonAmount(value: button)
            dismiss(animated: true)
        }
    }
}
