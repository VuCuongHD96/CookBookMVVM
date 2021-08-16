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
    var buttonYoutubeDidTap: Void { get set }
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
        useCase.getMeals(by: meal) { [weak self] meal in
            guard let self = self else { return }
            self.meal = meal
            self.setupTableViewData()
        }
    }
    
    private func setupTableViewData() {
        let listInstruction = createInstructions(from: meal)
        let listIngredient = createListIngredient(from: meal)
        mealDetailDataSourceDelegate = MealDetailDataSourceDelegate(listInstruction: listInstruction,
                                                                    listIngredient: listIngredient)
    }
    
    private func createInstructions(from data: Meal) -> [String] {
        let instructions = data.instructions
        var deleteNewLine = instructions.replacingOccurrences(of: "\n", with: "")
        deleteNewLine = deleteNewLine.replacingOccurrences(of: "\r", with: "")
        let splitString = deleteNewLine.split(separator: ".")
        var listInstruction = splitString.map {
            $0.trimmingCharacters(in: .whitespacesAndNewlines)
        }
        listInstruction = listInstruction.filter {
            $0.count > 1
        }
        return listInstruction
    }
    
    private func createListIngredient(from data: Meal) -> [FoodResource] {
        return data.resources
        
    }
    
    // MARK: - Action
    var buttonFavoriteDidTap: Void
    var buttonBackDidTap: Void {
        didSet {
            navigator.toPreviousScreen()
        }
    }

    var buttonYoutubeDidTap: Void {
        didSet {
            navigator.toVideoScreen(with: meal)
        }
    }
}
