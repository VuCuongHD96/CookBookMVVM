//
//  SearchViewModel.swift
//  CookBookMVVM
//
//  Created by admin on 8/14/21.
//

import Foundation

final class SearchViewModel {
    
    // MARK: - Property
    let navigator: SearchNavigatorType
    let useCase: SearchUseCaseType
    
    init(navigator: SearchNavigatorType, useCase: SearchUseCaseType) {
        self.navigator = navigator
        self.useCase = useCase
    }
}
