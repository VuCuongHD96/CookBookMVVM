//
//  MealByCategoryViewController.swift
//  CookBookRx
//
//  Created by admin on 8/21/21.
//

import UIKit
import Reusable
import MGArchitecture
import RxSwift
import RxCocoa
import SDWebImage

final class MealByCategoryViewController: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var backButton: UIButton!
    @IBOutlet private weak var searchButton: UIButton!
    @IBOutlet private weak var categoryNameLabel: UILabel!
    @IBOutlet private weak var numberRepiceLabel: UILabel!
    @IBOutlet private weak var categoryImageView: UIImageView!
    
    // MARK: - Define
    struct Constant {
        static let cellHeight: CGFloat = 200
    }
    
    // MARK: - Property
    var viewModel: MealByCategoryViewModel!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

extension MealByCategoryViewController: ViewControllerType {
    
    // MARK: - View
    func setupView() {
        tableView.do {
            $0.register(cellType: MealCell.self)
            $0.separatorStyle = .none
            $0.delegate = self
        }
        
        categoryImageView.showAnimatedGradientSkeleton()
    }
    
    // MARK: - Data
    func setupData() {
    }
}

extension MealByCategoryViewController: BindableType {
    
    func bindViewModel() {
        
        let input = MealByCategoryViewModel.Input(loadTrigger: Driver.just(Void()),
                                                  backTrigger: backButton.rx.tap.asDriver(),
                                                  searchTrigger: searchButton.rx.tap.asDriver())
        let output = viewModel.transform(input)
        
        output.meals
            .drive(tableView.rx.items) { tableView, row, meal in
                let indexPath = IndexPath(row: row, section: 0)
                let cell: MealCell = tableView.dequeueReusableCell(for: indexPath)
                cell.setContent(data: meal)
                return cell
            }.disposed(by: rx.disposeBag)
        
        output.totalRepice
            .drive(numberRepiceLabel.rx.text)
            .disposed(by: rx.disposeBag)
        
        output.categoryName
            .drive(categoryNameLabel.rx.text)
            .disposed(by: rx.disposeBag)
        
        output.categoryUrlString
            .drive(categoryImageView.rx.imageBinding)
            .disposed(by: rx.disposeBag)
        
        output.backDidTap
            .drive()
            .disposed(by: rx.disposeBag)
        
        output.searchDidTap
            .drive()
            .disposed(by: rx.disposeBag)
    }
}

extension MealByCategoryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constant.cellHeight
    }
}

extension MealByCategoryViewController: StoryboardSceneBased {
    static var sceneStoryboard = StoryBoard.mealByCategory
}
