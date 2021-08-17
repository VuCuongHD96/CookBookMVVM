//
//  AppNavigator.swift
//  CookBookMVVM
//
//  Created by admin on 8/12/21.
//

import UIKit

protocol AppNavigatorType {
    func gotoTabbarScreen()
}

struct AppNavigator: AppNavigatorType {
    unowned let window: UIWindow
    
    func gotoTabbarScreen() {
        let viewController = MealTabBarController.instantiate()
        let navigation = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigation
    }
}
