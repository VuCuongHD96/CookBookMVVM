//
//  TabbarNavigator.swift
//  CookBookRx
//
//  Created by admin on 8/21/21.
//

import UIKit

protocol TabbarNavigatorType {
    
    func createCategoryScreen() -> UIViewController
    func createHomeScreen() -> UIViewController
}

struct TabbarNavigator: TabbarNavigatorType {
    
    unowned let navigationController: UINavigationController
    
    private func createCategoryTabbarItem() -> UITabBarItem {
        let categoryNonSelect = UIImage(named: "Category")?.withRenderingMode(.alwaysOriginal)
        let categorySelected = UIImage(named: "CategorySelected")?.withRenderingMode(.alwaysOriginal)
        let tabbarItem = UITabBarItem(title: nil, image: categoryNonSelect, selectedImage: categorySelected)
        return tabbarItem
    }
    
    func createCategoryScreen() -> UIViewController {
        let useCase = CategoryUseCase()
        let viewModel = CategoryViewModel(useCase: useCase)
        let viewController = CategoryViewController.instantiate()
        viewController.viewModel = viewModel
        viewController.bindViewModel()
        viewController.tabBarItem = createCategoryTabbarItem()
        return viewController
    }
    
    private func createHomeTabbarItem() -> UITabBarItem {
        let categoryNonSelect = UIImage(named: "Home")?.withRenderingMode(.alwaysOriginal)
        let categorySelected = UIImage(named: "HomeSelected")?.withRenderingMode(.alwaysOriginal)
        let tabbarItem = UITabBarItem(title: nil, image: categoryNonSelect, selectedImage: categorySelected)
        return tabbarItem
    }
    
    func createHomeScreen() -> UIViewController {
        let navigator = HomeNavigator(navigationController: navigationController)
        let useCase = HomeUseCase()
        let viewModel = HomeViewModel(navigator: navigator, useCase: useCase)
        let viewController = HomeViewController.instantiate()
        viewController.viewModel = viewModel
        viewController.bindViewModel()
        viewController.tabBarItem = createHomeTabbarItem()
        return viewController
    }
}
