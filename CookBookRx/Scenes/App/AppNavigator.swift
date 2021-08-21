//
//  AppNavigator.swift
//  CookBookRx
//
//  Created by admin on 8/21/21.
//

import UIKit

protocol AppNavigatorType {
    func toMain()
    func toCategory()
}

struct AppNavigator: AppNavigatorType {
    unowned let window: UIWindow
    
    func toMain() {
        let viewController = TabbarController.instantiate()
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.isNavigationBarHidden = true
        window.rootViewController = navigationController
    }
    
    func toCategory() {
//        let navigator = CategoryNavigator(navigatorViewController: <#T##UIViewController#>)
        let useCase = CategoryUseCase()
        let viewModel = CategoryViewModel(useCase: useCase)
        let viewController = CategoryViewController.instantiate()
        viewController.viewModel = viewModel
        window.rootViewController = viewController
    }
}
