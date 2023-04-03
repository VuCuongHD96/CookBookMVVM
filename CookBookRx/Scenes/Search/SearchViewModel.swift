//
//  SearchViewModel.swift
//  CookBookRx
//
//  Created by admin on 8/22/21.
//

import MGArchitecture
import RxSwift

struct SearchViewModel {
    let navigator: SearchNavigatorType
    let useCase: SearchUseCaseType
}

extension SearchViewModel: ViewModel {
    
    struct Input {
        
    }
    
    struct Output {
        
    }
    
    func transform(_ input: Input, disposeBag: RxSwift.DisposeBag) -> Output {
        return Output()
    }
}
