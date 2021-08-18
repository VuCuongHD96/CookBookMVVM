//
//  VideoNavigator.swift
//  CookBookMVVM
//
//  Created by admin on 8/19/21.
//

import UIKit

protocol VideoNavigatorType {
    func toPreviousScreen() 
}

struct VideoNavigator: VideoNavigatorType {
    
    unowned let navigationController: UINavigationController
    
    func toPreviousScreen() {
        navigationController.popViewController(animated: true)
    }
}
