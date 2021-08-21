//
//  ViewController.swift
//  CookBookRx
//
//  Created by admin on 8/21/21.
//

import UIKit
import Reusable

final class TabbarController: UITabBarController {
    
    // MARK: - Property
    var viewModel: TabbarViewModel! {
        didSet {
            viewModel.dataDidChange = { [unowned self] _ in
                bindViewModel()
            }
        }
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
    }
    
    // MARK: - Bind data
    private func bindViewModel() {
        viewControllers = viewModel.viewControllers
    }
}

extension TabbarController: ViewControllerType {
    
    // MARK: - View
    func setupView() {
    }
    
    // MARK: - Data
    func setupData() {
        guard let navigationController = navigationController else {
            return
        }
        navigationController.isNavigationBarHidden = true
        let navigator = TabbarNavigator(navigationController: navigationController)
        viewModel = TabbarViewModel(navigator: navigator)
        viewModel.showData()
    }
}

extension TabbarController: StoryboardSceneBased {
    static var sceneStoryboard = StoryBoard.main
}
