//
//  CategoryViewController.swift
//  CookBookRx
//
//  Created by admin on 8/21/21.
//

import UIKit
import Reusable
import RxSwift
import RxCocoa
import NSObject_Rx
import Then
import MGArchitecture

final class CategoryViewController: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var searchButton: UIButton!
    
    // MARK: - Property
    var viewModel: CategoryViewModel!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupData()
    }
}

extension CategoryViewController: ViewControllerType {
    
    // MARK: - View
    func setupView() {
        tableView.do {
            $0.register(cellType: CategoryTitleCell.self)
        }
    }
    
    // MARK: - Data
    func setupData() {
    }
}

extension CategoryViewController: BindableType {
    
    func bindViewModel() {
        let input = CategoryViewModel.Input(loadTrigger: Driver.just(Void()),
                                            selectTrigger: tableView.rx.itemSelected.asDriver(),
                                            searchTrigger: searchButton.rx.tap.asDriver())
        let output = viewModel.transform(input)
        
        output.categories
            .drive(tableView.rx.items) { tableView, index, category in
                let indexPath = IndexPath(item: index, section: 0)
                let cell: CategoryTitleCell = tableView.dequeueReusableCell(for: indexPath)
                cell.setContent(data: category)
                return cell
            }
            .disposed(by: rx.disposeBag)
        
        output.selected
            .drive()
            .disposed(by: rx.disposeBag)
        
        output.search
            .drive()
            .disposed(by: rx.disposeBag)
    }
}

extension CategoryViewController: StoryboardSceneBased {
    static var sceneStoryboard = StoryBoard.category
}
