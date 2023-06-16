//
//  HomeGameViewController.swift
//  GameMemory
//
//  Created by Douglas  Rodrigues  on 25/04/23.
//

import UIKit

class HomeGameViewController: UIViewController {
    
    // MARK: - Properties
    
    private let homeGameView = HomeGameView()
    private var viewModel: HomeGameViewModelInput
    
    override func loadView() {
        view = homeGameView
    }
    
    init(viewModel: HomeGameViewModelInput) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        homeGameView.delegate = self
        viewModel.delegate = self
        viewModel.updateResult()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.updateResult()
    }
}

// MARK: - HomeGameViewDelegate

extension HomeGameViewController: HomeGameViewOutput {
    
    func clickButtonConfiguration() {
        let viewModel = SettingGameViewModel()
        let settingGameViewController = SettingGameViewController(viewModel: viewModel)
        settingGameViewController.delegate = self
        let navBarOnModal: UINavigationController = UINavigationController(rootViewController: settingGameViewController)
        if let sheet = navBarOnModal.sheetPresentationController {
            sheet.detents = [.custom(resolver: { context in
                0.6 * context.maximumDetentValue
            }), .large()]
        }
        navigationController?.present(navBarOnModal, animated: false)
    }
    
    func clickButtonStartGame() {
        let viewModel = PlayGamesViewModel(count: viewModel.saveResultButtons())
        let playGameViewController = PlayGameViewController(viewModel: viewModel)
        let navBarOnModal: UINavigationController = UINavigationController(rootViewController: playGameViewController)
        navBarOnModal.modalPresentationStyle = .fullScreen
        navigationController?.present(navBarOnModal, animated: false)
    }
}

// MARK: - HomeGameViewModelOutput

extension HomeGameViewController: HomeGameViewModelOutput {
    
    func onNumberAcert(number: HomeGameModel?) {
        homeGameView.setupData(setup: number)
    }
}

// MARK: - SettingGameViewControllerDelegate

extension HomeGameViewController: SettingGameViewControllerDelegate {
    func resetMatch() {
        viewModel.updateResult()
    }
}

