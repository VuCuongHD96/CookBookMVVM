//
//  MealByCategoryViewModel.swift
//  CookBookMVVM
//
//  Created by admin on 8/14/21.
//

import Foundation

protocol MealByCategoryViewModelType {
    
    // MARK: - Define
    typealias Listener = (MealByCategoryViewModelType) -> Void
    
    // MARK: - Property
    var dataDidChange: Listener? { get set }
    var mealByCategoryDatasouceDelegate: MealByCategoryDatasouceDelegate! { get }
    
    // MARK: - Data
    mutating func showData()
    
    // MARK: - Action
    var buttonSearchDidTap: Void { get set }
}

final class MealByCategoryViewModel: MealByCategoryViewModelType {
    
    // MARK: - Property
    let navigator: MealByCategoryNavigatorType
    let useCase: MealByCategoryUseCaseType
    let category: Category
    
    var dataDidChange: Listener?
    var mealByCategoryDatasouceDelegate: MealByCategoryDatasouceDelegate! {
        didSet {
            dataDidChange?(self)
        }
    }
    var mealArray = [Meal]()
    
    init(navigator: MealByCategoryNavigatorType,
         useCase: MealByCategoryUseCaseType,
         category: Category) {
        self.navigator = navigator
        self.useCase = useCase
        self.category = category
    }
    
    // MARK: - Data
    func showData() {
        useCase.getMeal(by: category) { [unowned self] mealArray in
            self.mealArray = mealArray
            self.mealByCategoryDatasouceDelegate = MealByCategoryDatasouceDelegate(mealArray: mealArray)
        }
    }
    
    // MARK: - Action
    var buttonSearchDidTap: Void
}
