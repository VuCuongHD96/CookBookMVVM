//
//  MealTabBarViewModel.swift
//  CookBookMVVM
//
//  Created by admin on 8/16/21.
//

import UIKit

protocol MealTabBarViewModelType {
    
    // MARK: - Define
    typealias Listener = (MealTabBarViewModelType) -> Void
    
    // MARK: - Property
    var dataDidChange: Listener? { get set }
    var viewControllers: [UIViewController] { get }
    
    // MARK: - Data
    mutating func showData()
}

final class MealTabBarViewModel: MealTabBarViewModelType {
    
    // MARK: - Property
    var navigator: MealTabbarNavigatorType
    
    var dataDidChange: Listener?
    var viewControllers = [UIViewController]() {
        didSet {
            dataDidChange?(self)
        }
    }
    
    init(navigator: MealTabbarNavigatorType) {
        self.navigator = navigator
    }
    
    // MARK: - Data
    func showData() {
        let homeScreen = navigator.createHomeScreen()
        let categoryScreen = navigator.createCategoryScreen()
        let favoriteScreen = navigator.createFavoriteScreen()
        viewControllers = [homeScreen, categoryScreen, favoriteScreen]
    }
}
