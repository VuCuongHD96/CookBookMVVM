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
    
    var dataDidChange: Listener?
    
    init(navigator: MealDetailNavigatorType, useCase: MealDetailUseCaseType) {
        self.navigator = navigator
        self.useCase = useCase
    }
    
    // MARK: - Data
    func showData() {
        
    }
    
    // MARK: - Action
    var buttonFavoriteDidTap: Void
    var buttonBackDidTap: Void
}
