//
//  CategoryImageCell.swift
//  CookBookMVVM
//
//  Created by admin on 8/17/21.
//

import UIKit
import Reusable
import SkeletonView
import SDWebImage

final class CategoryImageCell: UICollectionViewCell, NibReusable {

    // MARK: - Outlet
    @IBOutlet private weak var categoryImageView: UIImageView!
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    // MARK: - View
    private func setupView() {
        categoryImageView.isSkeletonable = true
        categoryImageView.showAnimatedGradientSkeleton()
    }

    // MARK: - Data
    func setContent(data: Category) {
        guard let url = URL(string: data.imageURL) else { return }
        categoryImageView.sd_setImage(with: url) { [weak self] (_, _, _, _) in
            guard let self = self else { return }
            self.categoryImageView.hideSkeleton()
        }
    }
}
