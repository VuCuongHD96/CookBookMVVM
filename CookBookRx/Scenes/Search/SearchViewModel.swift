//
//  SearchViewModel.swift
//  CookBookRx
//
//  Created by admin on 8/22/21.
//

import MGArchitecture

struct SearchViewModel {
    let navigator: SearchNavigatorType
    let useCase: SearchUseCaseType
}

extension SearchViewModel: ViewModelType {
    
    struct Input {
        
    }
    
    struct Output {
        
    }
    
    func transform(_ input: Input) -> Output {
        return Output()
    }
}
