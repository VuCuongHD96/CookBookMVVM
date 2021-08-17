//
//  MealTabBarController.swift
//  CookBookMVVM
//
//  Created by admin on 8/10/21.
//

import UIKit
import Reusable

final class MealTabBarController: UITabBarController {
    
    // MARK: - Property
    var viewModel: MealTabBarViewModel! {
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

extension MealTabBarController: ViewControllerType {
    
    // MARK: - View
    func setupView() {
    }
    
    // MARK: - Data
    func setupData() {
        guard let navigationController = navigationController else {
            return
        }
        navigationController.isNavigationBarHidden = true
        let navigator = MealTabbarNavigator(navigationController: navigationController)
        viewModel = MealTabBarViewModel(navigator: navigator)
        viewModel.showData()
    }
}

extension MealTabBarController: StoryboardSceneBased {
    static var sceneStoryboard = Storyboard.main
}
