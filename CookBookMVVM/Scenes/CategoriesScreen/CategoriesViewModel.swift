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
    var categoriesDatasource: CategoriesDatasource! { get }
    
    // MARK: - Data
    mutating func showData()
    
    // MARK: - Action
    var buttonSearchDidTap: Void { get set }
}

class CategoriesViewModel: CategoriesViewModelType {

    // MARK: - Property
    var navigator: CategoriesNavigatorType
    var useCase: CategoriesUseCaseType
    
    var dataDidChange: Listener?
    var categoriesDatasource: CategoriesDatasource! {
        didSet {
            dataDidChange?(self)
        }
    }
    
    // MARK: - Action
    var buttonSearchDidTap: Void {
        didSet {        
            navigator.goto()
        }
    }
    
    init(navigator: CategoriesNavigator, useCase: CategoriesUseCaseType) {
        self.navigator = navigator
        self.useCase = useCase
    }
    
    // MARK: - Data
    func showData() {
        useCase.getCategories { (listCategory) in
            self.categoriesDatasource = CategoriesDatasource(categories: listCategory)
        }
    }
}
