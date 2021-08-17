//
//  HomeViewModel.swift
//  CookBookMVVM
//
//  Created by admin on 8/17/21.
//

import Foundation

protocol HomeViewModelType {
    
    // MARK: - Define
    typealias Listener = (HomeViewModelType) -> Void
    
    // MARK: - Property
    var dataDidChange: Listener? { get set }
    var homeCategoryDatasourceDelegate: HomeCategoryDatasourceDelegate! { get }
    var homeMealDatasourceDelegate: HomeMealDatasourceDelegate! { get }
    
    // MARK: - Data
    mutating func showData()
    
    // MARK: - Action
    var buttonSearchDidTap: Void { get set }
}

final class HomeViewModel: HomeViewModelType {
    
    // MARK: - Property
    let navigator: HomeNavigatorType
    let useCase: HomeUseCaseType
    
    let categoryArray = Array(repeating: Category(), count: 5)
    let mealArray = Array(repeating: Meal(), count: 5)
    var dataDidChange: Listener?
    var homeCategoryDatasourceDelegate: HomeCategoryDatasourceDelegate! {
        didSet {
            dataDidChange?(self)
        }
    }
    
    var homeMealDatasourceDelegate: HomeMealDatasourceDelegate! {
        didSet {
            dataDidChange?(self)
        }
    }
    
    init(navigator: HomeNavigatorType, useCase: HomeUseCaseType) {
        self.navigator = navigator
        self.useCase = useCase
    }
    
    // MARK: - Data
    func showData() {
        homeCategoryDatasourceDelegate = HomeCategoryDatasourceDelegate(categoryArray: categoryArray)
        homeMealDatasourceDelegate = HomeMealDatasourceDelegate(mealArray: mealArray)
    }
    
    // MARK: - Action
    var buttonSearchDidTap: Void
}
