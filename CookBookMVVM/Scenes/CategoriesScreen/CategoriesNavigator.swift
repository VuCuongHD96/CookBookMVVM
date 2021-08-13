//
//  CategoriesNavigator.swift
//  CookBookMVVM
//
//  Created by admin on 8/12/21.
//

import UIKit

protocol CategoriesNavigatorType {
    func goto()
}

struct CategoriesNavigator: CategoriesNavigatorType {
    unowned let navigationController: UINavigationController
    
    func goto() {
        print("aaaa")
        navigationController.navigationBar.isHidden = true
    }
}
