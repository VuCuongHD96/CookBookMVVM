//
//  MealDetailViewModel.swift
//  CookBookMVVM
//
//  Created by admin on 8/15/21.
//

import Foundation

protocol MealDetailViewModelType {
    
    // MARK: - Define
    typealias Listener = (MealDetailViewModelType) -> Void
    
    // MARK: - Property
    var dataDidChange: Listener? { get set }
    var mealDetailDataSourceDelegate: MealDetailDataSourceDelegate! { get }
    
    // MARK: - Data
    func showData()
    
    // MARK: - Action
    var buttonFavoriteDidTap: Void { get set }
    var buttonBackDidTap: Void { get set }
}

final class MealDetailViewModel: MealDetailViewModelType {
    
    // MARK: - Property
    let navigator: MealDetailNavigatorType
    let useCase: MealDetailUseCaseType
    var meal: Meal
    
    var dataDidChange: Listener?
    var mealDetailDataSourceDelegate: MealDetailDataSourceDelegate! {
        didSet {
            dataDidChange?(self)
        }
    }
    
    init(navigator: MealDetailNavigatorType, useCase: MealDetailUseCaseType, meal: Meal) {
        self.navigator = navigator
        self.useCase = useCase
        self.meal = meal
    }
    
    // MARK: - Data
    func showData() {
        useCase.getMeals(by: meal) { meal in
            self.meal = meal
            self.mealDetailDataSourceDelegate = MealDetailDataSourceDelegate()
        }
        
    }
    
    // MARK: - Action
    var buttonFavoriteDidTap: Void
    var buttonBackDidTap: Void
}
