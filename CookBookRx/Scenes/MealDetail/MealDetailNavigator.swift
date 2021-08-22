//
//  MealDetailNavigator.swift
//  CookBookRx
//
//  Created by admin on 8/22/21.
//

import UIKit

protocol MealDetailNavigatorType {
    func toPrevious() 
}

struct MealDetailNavigator: MealDetailNavigatorType {
    
    unowned let navigationController: UINavigationController
    
    func toPrevious() {
        navigationController.popViewController(animated: true)
    }
}
