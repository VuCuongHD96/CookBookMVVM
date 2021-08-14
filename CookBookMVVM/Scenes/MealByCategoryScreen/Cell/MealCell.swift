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
    
    // MARK: - View
    private func setupView() {
        selectionStyle = .none
    }
}
