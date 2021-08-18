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
        setupCategoryData()
        setupMealData()
    }
    
    private func setupCategoryData() {
        homeCategoryDatasourceDelegate = HomeCategoryDatasourceDelegate(categoryArray: categoryArray)
        useCase.getAllCategory { [weak self] (categoryArray) in
            guard let self = self else { return }
            self.homeCategoryDatasourceDelegate = HomeCategoryDatasourceDelegate(categoryArray: categoryArray)
            self.setupCategoryAction()
        }
    }
    
    private func setupMealData() {
        homeMealDatasourceDelegate = HomeMealDatasourceDelegate(mealArray: mealArray)
        useCase.getAllMeal { [weak self] (mealArray) in
            guard let self = self else { return }
            self.homeMealDatasourceDelegate = HomeMealDatasourceDelegate(mealArray: mealArray)
            self.setupMealAction()
        }
    }
    
    // MARK: - Action
    private func setupCategoryAction() {
        homeCategoryDatasourceDelegate.didSelectCategory = { [weak self] category in
            guard let self = self else { return }
            self.navigator.toMealByCategoryScreen(catogory: category)
        }
    }
    
    private func setupMealAction() {
        homeMealDatasourceDelegate.didSelectedMeal = { [weak self] meal in
            guard let self = self else { return }
            self.navigator.toMealDetailScreen(data: meal)
        }
    }
    
    var buttonSearchDidTap: Void {
        didSet {
            navigator.toSearchScreen()
        }
    }
}
