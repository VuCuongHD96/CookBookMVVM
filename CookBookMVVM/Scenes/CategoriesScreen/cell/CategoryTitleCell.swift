//
//  CategoryTitleCell.swift
//  CookBookMVVM
//
//  Created by admin on 8/11/21.
//

import UIKit
import Reusable

final class CategoryTitleCell: UITableViewCell, NibReusable {

    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    // MARK: - View
    private func setupView() {
        selectionStyle = .none
    }
}
