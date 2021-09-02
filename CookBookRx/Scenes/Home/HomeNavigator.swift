//
//  HomeNavigator.swift
//  CookBookRx
//
//  Created by admin on 8/21/21.
//

import UIKit

protocol HomeNavigatorType {
    func toSearch()
    func toMealByCategory(data: Category)
    func toMealDetail(data: Meal)
}

struct HomeNavigator: HomeNavigatorType {
    
    unowned let navigationController: UINavigationController
    
    func toSearch() {
        let navigator = SearchNavigator(navigationController: navigationController)
        let useCase = SearchUseCase()
        let viewModel = SearchViewModel(navigator: navigator, useCase: useCase)
        let viewController = SearchViewController.instantiate()
        viewController.viewModel = viewModel
        viewController.bindViewModel(to: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func toMealByCategory(data: Category) {
        let navigator = MealByCategoryNavigator(navigationController: navigationController)
        let useCase = MealByCategoryUseCase()
        let viewModel = MealByCategoryViewModel(navigator: navigator, useCase: useCase, category: data)
        let viewController = MealByCategoryViewController.instantiate()
        viewController.viewModel = viewModel
        viewController.bindViewModel(to: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func toMealDetail(data: Meal) {
        let navigator = MealDetailNavigator(navigationController: navigationController)
        let useCase = MealDetailUseCase()
        let viewModel = MealDetailViewModel(navigator: navigator, useCase: useCase, meal: data)
        let viewController = MealDetailViewController.instantiate()
        viewController.viewModel = viewModel
        viewController.bindViewModel(to: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
}
