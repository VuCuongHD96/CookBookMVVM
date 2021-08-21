//
//  CategoryNavigator.swift
//  CookBookRx
//
//  Created by admin on 8/21/21.
//

import UIKit

protocol CategoryNavigatorType {
    func toMealByCategory(data: Category)
    func toSearch() 
}

struct CategoryNavigator: CategoryNavigatorType {
    
    unowned let navigationController: UINavigationController
    
    func toMealByCategory(data: Category) {
        let navigator = MealByCategoryNavigator(navigationController: navigationController)
        let useCase = MealByCategoryUseCase()
        let viewModel = MealByCategoryViewModel(navigator: navigator, useCase: useCase)
        let viewController = MealByCategoryViewController.instantiate()
        viewController.viewModel = viewModel
        viewController.bindViewModel(to: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func toSearch() {
        let navigator = SearchNavigator(navigationController: navigationController)
        let useCase = SearchUseCase()
        let viewModel = SearchViewModel(navigator: navigator, useCase: useCase)
        let viewController = SearchViewController.instantiate()
        viewController.viewModel = viewModel
        viewController.bindViewModel(to: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
}
