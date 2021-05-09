//
//  TagCollectionViewCell.swift
//  ict-hack
//
//  Created by  Matvey on 08.05.2021.
//

import UIKit
import MaterialComponents.MaterialChips

class TagCollectionCell: MDCChipCollectionViewCell {
    
    private let tagsList = ["Дизайнер", "Ментор", "Иллюстрация"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        isUserInteractionEnabled = false
        chipView.titleFont = UIFont.systemFont(ofSize: 13, weight: .regular)
        chipView.cornerRadius = 8
    }
    
    func configureCell(item: Int, tags: [String]) {
        let tag = tags[item]
        chipView.titleLabel.text = tag
        chipView.setBackgroundColor(UIColor.chipView.colorList[item % 4], for: .normal)
        chipView.sizeToFit()
    }
}
