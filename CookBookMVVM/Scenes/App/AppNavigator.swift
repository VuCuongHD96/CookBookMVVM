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
        let storyBoard = UIStoryboard(name: "Categories", bundle: nil)
        guard let viewController = storyBoard.instantiateViewController(withIdentifier: "CategoriesViewController") as? CategoriesViewController else {
            return
        }
        window.rootViewController = viewController
    }
}
