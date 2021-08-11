//
//  AppNavigator.swift
//  CookBookMVVM
//
//  Created by admin on 8/12/21.
//

import UIKit

protocol AppNavigatorType {
    func gotoCategoryScreen()
}

struct AppNavigator: AppNavigatorType {
    unowned let window: UIWindow
    
    func gotoCategoryScreen() {
        let viewController = CategoriesViewController.instantiate()
        let navigation = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigation
    }
}
