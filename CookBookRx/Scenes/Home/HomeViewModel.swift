//
//  HomeViewModel.swift
//  CookBookRx
//
//  Created by admin on 8/21/21.
//

import MGArchitecture
import RxSwift
import RxCocoa

struct HomeViewModel {
    let navigator: HomeNavigatorType
    let useCase: HomeUseCaseType
}

extension HomeViewModel: ViewModelType {
    
    struct Input {
        
    }
    
    struct Output {
        
    }
    
    func transform(_ input: Input) -> Output {
        
        return Output()
    }
}
