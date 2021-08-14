//
//  CategoriesViewModel.swift
//  CookBookMVVM
//
//  Created by admin on 8/11/21.
//

import Foundation

protocol CategoriesViewModelType {
    
    // MARK: - Define
    typealias Listener = (CategoriesViewModelType) -> Void
    
    // MARK: - Property
    var dataDidChange: Listener? { get set }
    var categoriesDatasourceDelegate: CategoriesDatasourceDelegate! { get }
    
    // MARK: - Data
    mutating func showData()
    
    // MARK: - Action
    var buttonSearchDidTap: Void { get set }
}

final class CategoriesViewModel: CategoriesViewModelType {

    // MARK: - Property
    var navigator: CategoriesNavigatorType
    var useCase: CategoriesUseCaseType
    
    var dataDidChange: Listener?
    var categoriesDatasourceDelegate: CategoriesDatasourceDelegate! {
        didSet {
            dataDidChange?(self)
        }
    }
    
    // MARK: - Action
    var buttonSearchDidTap: Void {
        didSet {        
            navigator.toSearchScreen()
        }
    }
    
    init(navigator: CategoriesNavigator, useCase: CategoriesUseCaseType) {
        self.navigator = navigator
        self.useCase = useCase
    }
    
    // MARK: - Data
    func showData() {
        useCase.getCategories { [weak self] listCategory in
            guard let self = self else { return }
            self.categoriesDatasourceDelegate = CategoriesDatasourceDelegate(categories: listCategory)
            self.setupSelectAction()
        }
    }
    
    private func setupSelectAction() {
        self.categoriesDatasourceDelegate.didChoiseData = { category in
            self.navigator.toMealByCategoryScreen(catogory: category)
        }
    }
}
