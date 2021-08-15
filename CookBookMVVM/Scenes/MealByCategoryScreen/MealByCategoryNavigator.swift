//
//  MealByCategoryNavigator.swift
//  CookBookMVVM
//
//  Created by admin on 8/14/21.
//

import UIKit

protocol MealByCategoryNavigatorType {
    func toSearchScreen()
    func toPreviousScreen()
    func toMealDetailScreen(data: Meal)
}

struct MealByCategoryNavigator: MealByCategoryNavigatorType {
    
    unowned let navigationController: UINavigationController
    
    func toSearchScreen() {
        let navigator = SearchNavigator(navigation: navigationController)
        let useCase = SearchUseCase()
        let viewModel = SearchViewModel(navigator: navigator, useCase: useCase)
        let viewController = SearchViewController.instantiate()
        viewController.viewModel = viewModel
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func toPreviousScreen() {
        navigationController.popViewController(animated: true)
    }
    
    func toMealDetailScreen(data: Meal) {
        let navigator = MealDetailNavigator(navigationController: navigationController)
        let useCase = MealDetailUseCase()
        let viewModel = MealDetailViewModel(navigator: navigator, useCase: useCase, meal: data)
        let viewController = MealDetailViewController.instantiate()
        viewController.viewModel = viewModel
        navigationController.pushViewController(viewController, animated: true)
    }
}
