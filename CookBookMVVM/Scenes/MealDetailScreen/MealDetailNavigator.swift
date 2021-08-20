//
//  MealDetailNavigator.swift
//  CookBookMVVM
//
//  Created by admin on 8/15/21.
//

import UIKit

protocol MealDetailNavigatorType {
    func toPreviousScreen()
    func toVideoScreen(with meal: Meal) 
}

struct MealDetailNavigator: MealDetailNavigatorType {
    
    unowned let navigationController: UINavigationController
    
    func toPreviousScreen() {
        navigationController.popViewController(animated: true)
    }
    
    func toVideoScreen(with meal: Meal) {
        let navigator = VideoNavigator(navigationController: navigationController)
        let viewModel = VideoViewModel(navigator: navigator, meal: meal)
        let viewController = VideoViewController.instantiate()
        viewController.viewModel = viewModel
        navigationController.pushViewController(viewController, animated: true)
    }
}
