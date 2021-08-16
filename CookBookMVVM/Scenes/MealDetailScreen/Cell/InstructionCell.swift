//
//  InstructionCell.swift
//  CookBookMVVM
//
//  Created by admin on 8/15/21.
//

import UIKit
import Reusable

final class InstructionCell: UITableViewCell, NibReusable {

    @IBOutlet private weak var instructionLabel: UILabel!
    @IBOutlet private weak var numberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    // MARK: - View
    private func setupView() {
        selectionStyle = .none
    }
    
    // MARK: - Data
    func setupContent(data: String, index: Int) {
        instructionLabel.text = data
        numberLabel.text = String(index + 1)
    }
}
