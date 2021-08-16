//
//  IngredientCell.swift
//  CookBookMVVM
//
//  Created by admin on 8/15/21.
//

import UIKit
import Reusable

final class IngredientCell: UITableViewCell, NibReusable {

    // MARK: - Outlet
    @IBOutlet private weak var ingredientLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    // MARK: - View
    private func setupView() {
        selectionStyle = .none
    }
    
    // MARK: - Data
    func setContent(data: FoodResource) {
        ingredientLabel.text = "\(data.measure) \(data.ingredient)"
    }
}
