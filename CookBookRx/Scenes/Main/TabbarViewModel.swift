//
//  TabbarViewModel.swift
//  CookBookRx
//
//  Created by admin on 8/21/21.
//

import MGArchitecture

protocol TabbarViewModelType {
    
    // MARK: - Define
    typealias Listener = (TabbarViewModelType) -> Void
    
    // MARK: - Property
    var dataDidChange: Listener? { get set }
    var viewControllers: [UIViewController] { get }
    
    // MARK: - Data
    mutating func showData()
}

final class TabbarViewModel: TabbarViewModelType {
    
    // MARK: - Property
    var navigator: TabbarNavigatorType
    
    var dataDidChange: Listener?
    var viewControllers = [UIViewController]() {
        didSet {
            dataDidChange?(self)
        }
    }
    
    init(navigator: TabbarNavigatorType) {
        self.navigator = navigator
    }
    
    // MARK: - Data
    func showData() {
        let categoryScreen = navigator.createCategoryScreen()
        let homeScreen = navigator.createHomeScreen()
        viewControllers = [homeScreen, categoryScreen]
    }
}
