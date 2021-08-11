//
//  CategoriesViewController.swift
//  CookBookMVVM
//
//  Created by admin on 8/11/21.
//

import UIKit

class CategoriesViewController: UIViewController {

    private let castRepository = CategoriesRepositoryImpl(api: APIService.share)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        castRepository.getCategories { result in
            switch result {
            case .success(let categoriesReponse):
                print(categoriesReponse?.categories as Any)
            case .failure(let error):
                print(error as Any)
            }
        }
    }
}
