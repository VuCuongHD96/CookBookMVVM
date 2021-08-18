//
//  HomeNavigator.swift
//  CookBookMVVM
//
//  Created by admin on 8/17/21.
//

import UIKit

protocol HomeNavigatorType {
    func toSearchScreen()
    func toMealByCategoryScreen(catogory: Category)
    func toMealDetailScreen(data: Meal) 
}

struct HomeNavigator: HomeNavigatorType {
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
    
    
    func toMealDetailScreen(data: Meal) {
        let navigator = MealDetailNavigator(navigationController: navigationController)
        let useCase = MealDetailUseCase()
        let viewModel = MealDetailViewModel(navigator: navigator, useCase: useCase, meal: data)
        let viewController = MealDetailViewController.instantiate()
        viewController.viewModel = viewModel
        navigationController.pushViewController(viewController, animated: true)
    }
}
