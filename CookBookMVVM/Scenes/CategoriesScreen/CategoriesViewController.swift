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
            viewModel.dataDidChange = { [unowned self] viewModel in
                self.tableView.dataSource = viewModel.categoriesDatasourceDelegate
                self.tableView.delegate = viewModel.categoriesDatasourceDelegate
                self.tableView.reloadData()
            }
        }
    }
        
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupData()
        navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func searchAction(_ sender: Any) {
        viewModel.buttonSearchDidTap = Void()
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
        viewModel.showData()
    }
}

extension CategoriesViewController: StoryboardSceneBased {
    static var sceneStoryboard = Storyboard.categories
}
