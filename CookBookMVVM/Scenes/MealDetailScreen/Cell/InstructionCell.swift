//
//  InstructionCell.swift
//  CookBookMVVM
//
//  Created by admin on 8/15/21.
//

import UIKit
import Reusable

final class InstructionCell: UITableViewCell, NibReusable {

    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    // MARK: - View
    private func setupView() {
        selectionStyle = .none
    }
}
