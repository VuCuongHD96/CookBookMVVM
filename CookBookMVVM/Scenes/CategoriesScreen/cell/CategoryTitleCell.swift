//
//  CategoryTitleCell.swift
//  CookBookMVVM
//
//  Created by admin on 8/11/21.
//

import UIKit
import Reusable
import SkeletonView

final class CategoryTitleCell: UITableViewCell, NibReusable {

    // MARK: - Outlet
    @IBOutlet private weak var categoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    // MARK: - View
    private func setupView() {
        selectionStyle = .none
        categoryLabel.showAnimatedGradientSkeleton()
    }
    
    // MARK: - Data
    func setContent(data: Category) {
        if data.name != "" {
            categoryLabel.text = data.name
            categoryLabel.hideSkeleton()            
        }
    }
}
