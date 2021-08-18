//
//  MealTabbarNavigator.swift
//  CookBookMVVM
//
//  Created by admin on 8/16/21.
//

import UIKit

protocol MealTabbarNavigatorType {
    func createCategoryScreen() -> UIViewController
    func createHomeScreen() -> UIViewController
    func createFavoriteScreen() -> UIViewController
}

struct MealTabbarNavigator: MealTabbarNavigatorType {
    unowned let navigationController: UINavigationController
    
    private func createCategoryTabbarItem() -> UITabBarItem {
        let categoryNonSelect = UIImage(named: "Category")?.withRenderingMode(.alwaysOriginal)
        let categorySelected = UIImage(named: "CategorySelected")?.withRenderingMode(.alwaysOriginal)
        let tabbarItem = UITabBarItem(title: nil, image: categoryNonSelect, selectedImage: categorySelected)
        return tabbarItem
    }
    
    func createCategoryScreen() -> UIViewController {
        let navigator = CategoriesNavigator(navigationController: navigationController)
        let useCase = CategoriesUseCase()
        let viewModel = CategoriesViewModel(navigator: navigator, useCase: useCase)
        let viewController = CategoriesViewController.instantiate()
        viewController.viewModel = viewModel
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
        viewController.tabBarItem = createHomeTabbarItem()
        return viewController
    }
    
    private func createFavoriteTabbarItem() -> UITabBarItem {
        let categoryNonSelect = UIImage(named: "Favorite")?.withRenderingMode(.alwaysOriginal)
        let categorySelected = UIImage(named: "FavoriteSelected")?.withRenderingMode(.alwaysOriginal)
        let tabbarItem = UITabBarItem(title: nil, image: categoryNonSelect, selectedImage: categorySelected)
        return tabbarItem
    }
    
    func createFavoriteScreen() -> UIViewController {
        let viewController = FavoriteViewController.instantiate()
        viewController.tabBarItem = createFavoriteTabbarItem()
        return viewController
    }
}
