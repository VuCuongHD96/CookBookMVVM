//
//  CategoriesNavigator.swift
//  CookBookMVVM
//
//  Created by admin on 8/12/21.
//

import UIKit

protocol CategoriesNavigatorType {
    func toSearchScreen()
    func toMealByCategoryScreen(catogory: Category)
}

struct CategoriesNavigator: CategoriesNavigatorType {
    unowned let navigationController: UINavigationController
    
    func toSearchScreen() {
        let navigator = SearchNavigator(navigation: navigationController)
        let useCase = SearchUseCase()
        let viewModel = SearchViewModel(navigator: navigator, useCase: useCase)
        let viewController = SearchViewController.instantiate()
        viewController.viewModel = viewModel
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func toMealByCategoryScreen(catogory: Category) {
        let navigator = MealByCategoryNavigator(navigationController: navigationController)
        let useCase = MealByCategoryUseCase()
        let viewModel = MealByCategoryViewModel(navigator: navigator, useCase: useCase, category: catogory)
        let viewController = MealByCategoryViewController.instantiate()
        viewController.viewModel = viewModel
        navigationController.pushViewController(viewController, animated: true)
    }
}
