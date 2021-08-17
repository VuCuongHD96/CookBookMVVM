//
//  HomeViewController.swift
//  CookBookMVVM
//
//  Created by admin on 8/16/21.
//

import UIKit
import Reusable
import Then

final class HomeViewController: UIViewController {

    // MARK: - Outlet
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Property
    var viewModel: HomeViewModelType! {
        didSet {
            viewModel.dataDidChange = { [unowned self] _ in
                bindViewModel()
            }
        }
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupData()
    }
    
    // MARK: - Bind Data
    private func bindViewModel() {
        collectionView.do {
            $0.dataSource = viewModel.homeCategoryDatasourceDelegate
            $0.delegate = viewModel.homeCategoryDatasourceDelegate
            $0.reloadData()
        }
        
        tableView.do {
            $0.dataSource = viewModel.homeMealDatasourceDelegate
            $0.delegate = viewModel.homeMealDatasourceDelegate
            $0.reloadData()
        }
    }
}

extension HomeViewController: ViewControllerType {
    
    // MARK: - View
    func setupView() {
        tableView.do {
            $0.separatorStyle = .none
            $0.showsVerticalScrollIndicator = false
            $0.register(cellType: MealCell.self)
        }
        collectionView.do {
            $0.showsVerticalScrollIndicator = false
            $0.showsHorizontalScrollIndicator = false
            $0.register(cellType: CategoryImageCell.self)
        }
    }
    
    // MARK: - Data
    func setupData() {
        viewModel.showData()
    }
}

extension HomeViewController: StoryboardSceneBased {
    static var sceneStoryboard = Storyboard.home
}
