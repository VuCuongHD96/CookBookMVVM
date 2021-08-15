//
//  MealCell.swift
//  CookBookMVVM
//
//  Created by admin on 8/14/21.
//

import UIKit
import Reusable

final class MealCell: UITableViewCell, NibReusable {
    
    // MARK: - Outlet
    @IBOutlet private weak var mealImageView: UIImageView!
    @IBOutlet private weak var mealNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        mealImageView.image = nil
        mealNameLabel.text = nil
    }
    
    // MARK: - View
    private func setupView() {
        selectionStyle = .none
    }
    
    func setContent(data: Meal) {
        mealImageView.showGradientSkeleton()
        let urlString = data.imageString
        let url = URL(string: urlString)
        mealImageView.sd_setImage(with: url) { [weak self] (_, _, _, _) in
            guard let self = self else { return }
            self.mealImageView.hideSkeleton()
        }
        mealNameLabel.text = data.name
    }
}
