//
//  HomeGameViewControllerTests.swift
//  GameMemoryTests
//
//  Created by Douglas  Rodrigues  on 09/06/23.
//

import XCTest
@testable import GameMemory

final class HomeGameViewControllerTests: XCTestCase {
    
    func test_call_viewDidLoad_homeGameViewController() {
        let viewModelHomeGameViewModel = HomeGameViewModelInputSpy()
        lazy var homeGameViewController = HomeGameViewController(viewModel: viewModelHomeGameViewModel)
        homeGameViewController.viewDidLoad()
        
        XCTAssertTrue(viewModelHomeGameViewModel.checkPassedUpdateResults)
    }
    
    func test_call_viewDidAppear_homeGameViewController() {
        let viewModelHomeGameViewModel = HomeGameViewModelInputSpy()
        lazy var homeGameViewController = HomeGameViewController(viewModel: viewModelHomeGameViewModel)
        homeGameViewController.viewDidAppear(true)
        
        XCTAssertTrue(viewModelHomeGameViewModel.checkPassedUpdateResults)
    }
    
    func test_call_settingGameViewControllerDelegateSpy() {
        let viewModelHomeGameViewModel = HomeGameViewModelInputSpy()
        let homeGameViewController = HomeGameViewController(viewModel: viewModelHomeGameViewModel)
        homeGameViewController.resetMatch()
        
        XCTAssertTrue(viewModelHomeGameViewModel.checkPassedUpdateResults)
    }
    
    
    
//    func test_naviagationController_clickButtonConfiguration() {
//        let viewModel = HomeGameViewModel(userDefaults: .standard)
//        let homeGameViewController = HomeGameViewController(viewModel: viewModel)
//        let spy = SpyNavigationController(rootViewController: homeGameViewController)
//        homeGameViewController.clickButtonConfiguration()
//
//        XCTAssertTrue(spy.pushViewController is SettingGameViewController)
//    }
//
//    func test_naviagationController_clickButtonStartGame() {
//        let viewModel = HomeGameViewModel(userDefaults: .standard)
//        let homeGameViewController = HomeGameViewController(viewModel: viewModel)
//        let spy = SpyNavigationController(rootViewController: homeGameViewController)
//        homeGameViewController.clickButtonStartGame()
//
//        XCTAssertTrue(spy.pushViewController is PlayGameViewController)
//    }

}
