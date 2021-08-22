//
//  MealDetailViewController.swift
//  CookBookRx
//
//  Created by admin on 8/22/21.
//

import MGArchitecture
import RxCocoa
import RxSwift
import Reusable
import RxDataSources

final class MealDetailViewController: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet private weak var backButton: UIButton!
    @IBOutlet private weak var favoriteButton: UIButton!
    @IBOutlet private weak var youtubeButton: UIButton!
    @IBOutlet private weak var categoryNameLabel: UILabel!
    @IBOutlet private weak var mealNameLabel: UILabel!
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var mealImageView: UIImageView!
    
    // MARK: - Property
    var viewModel: MealDetailViewModel!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

extension MealDetailViewController: ViewControllerType {
    
    // MARK: - View
    func setupView() {
        tableView.do {
            $0.register(cellType: InstructionCell.self)
            $0.separatorStyle = .none
        }
    }
    
    private func showAnimation() {
        mealImageView.showAnimatedGradientSkeleton()
        categoryNameLabel.showAnimatedGradientSkeleton()
        mealNameLabel.showAnimatedGradientSkeleton()
    }
    
    private func hideAnimation() {
        mealImageView.hideSkeleton()
        categoryNameLabel.hideSkeleton()
        mealNameLabel.hideSkeleton()
    }
    
    private func setupAnimation(_ dataLoading: Bool) {
        switch dataLoading {
        case true: showAnimation()
        case false: hideAnimation()
        }
    }
    
    // MARK: - Data
    func setupData() {
        
    }
}

extension MealDetailViewController: BindableType {
    func bindViewModel() {
        let input = MealDetailViewModel.Input(loadTrigger: Driver.just(Void()),
                                              backTrigger: backButton.rx.tap.asDriver())
        let output = viewModel.transform(input)
        
        output.mealUrlString
            .drive(mealImageView.rx.imageBinding)
            .disposed(by: rx.disposeBag)
        
        output.categoryName
            .drive(categoryNameLabel.rx.text)
            .disposed(by: rx.disposeBag)
        
        output.mealName
            .drive(mealNameLabel.rx.text)
            .disposed(by: rx.disposeBag)
        
        output.backDidTap
            .drive()
            .disposed(by: rx.disposeBag)
        
        output.activity
            .drive(animationBinding)
            .disposed(by: rx.disposeBag)
        
        let dataSource = RxTableViewSectionedReloadDataSource<SectionData>(configureCell: { dataSource, tableView, indexPath, item in
            let section = indexPath.row
            let row = indexPath.row
            switch section {
            case 0:
                let cell: InstructionCell = tableView.dequeueReusableCell(for: indexPath)
                cell.setContent(data: item, index: row)
                return cell
            case 1:
                let cell: IngredientCell = tableView.dequeueReusableCell(for: indexPath)
//                cell.setContent(data: item)
                return cell
            default:
                return UITableViewCell()
            }
        })
        
        output.sections
            .drive(tableView.rx.items(dataSource: dataSource))
            .disposed(by: rx.disposeBag)
    }
}

extension MealDetailViewController {
    var animationBinding: Binder<Bool> {
        return Binder(self) { viewController, dataLoading in
            viewController.setupAnimation(dataLoading)
        }
    }
}

extension MealDetailViewController: StoryboardSceneBased {
    static var sceneStoryboard = StoryBoard.mealDetail
}
