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
}

struct CategoriesViewModel: CategoriesViewModelType {

    // MARK: - Property
    var navigator: CategoriesNavigator
    var dataDidChange: Listener?
    var categories = Array(repeating: Category(), count: 10)
    var categoriesDatasource: CategoriesDatasource! {
        didSet {
            dataDidChange?(self)
        }
    }
    
    // MARK: - Data
    mutating func showData() {
        categoriesDatasource = CategoriesDatasource(categories: categories)
        navigator.goto()
    }
}
