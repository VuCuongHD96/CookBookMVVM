//
//  ViewController.swift
//  CookBookMVVM
//
//  Created by admin on 8/10/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storyBoard = UIStoryboard(name: "Categories", bundle: nil)
        guard let vc = storyBoard.instantiateViewController(withIdentifier: "CategoriesViewController") as? CategoriesViewController else {
            return
        }
        navigationController?.pushViewController(vc, animated: true)
    }
}

