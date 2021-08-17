//
//  MealDetailNavigator.swift
//  CookBookMVVM
//
//  Created by admin on 8/15/21.
//

import UIKit

protocol MealDetailNavigatorType {
    func toPreviousScreen()
}

struct MealDetailNavigator: MealDetailNavigatorType {
    
    unowned let navigationController: UINavigationController
    
    func toPreviousScreen() {
        navigationController.popViewController(animated: true)
    }
}
