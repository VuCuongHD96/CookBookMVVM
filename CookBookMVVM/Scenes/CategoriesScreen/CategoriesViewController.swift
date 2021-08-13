//
//  CategoriesViewController.swift
//  CookBookMVVM
//
//  Created by admin on 8/11/21.
//

import UIKit
import Reusable

final class CategoriesViewController: UIViewController {

    // MARK: - Outlet
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Property
    var viewModel: CategoriesViewModelType! {
        didSet {
            viewModel.dataDidChange = { viewModel in
                self.tableView.dataSource = viewModel.categoriesDatasource
                self.tableView.reloadData()
            }
        }
    }
    
    private let castRepository = CategoriesRepositoryImpl(api: APIService.share)
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupData()

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

extension CategoriesViewController: ViewControllerType {
    
    // MARK: - View
    func setupView() {
        tableView.separatorStyle = .none
        tableView.register(cellType: CategoryTitleCell.self)
    }
    
    // MARK: - Data
    func setupData() {
        let categoriesNavigator = CategoriesNavigator(navigationController: navigationController!)
        viewModel = CategoriesViewModel(navigator: categoriesNavigator)
        viewModel.showData()
    }
}

extension CategoriesViewController: StoryboardSceneBased {
    static var sceneStoryboard = Storyboard.categories
}
