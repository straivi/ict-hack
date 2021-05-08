//
//  ExpandableCollectionCell.swift
//  ict-hack
//
//  Created by  Matvey on 07.05.2021.
//

import UIKit
import AppstoreTransition

class ExpandableCollectionCell: UICollectionViewCell {
    
    private let imageView = UIImageView()
    
    private var initialFrame: CGRect?
    private var initialCornerRadius: CGFloat?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        configureLayout()
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCell() {
        imageView.image = AppImage.sampleImage
    }
}

extension ExpandableCollectionCell: CardCollectionViewCell {
    var cardContentView: UIView {
        get {
            configureCardView()
        }
    }
    
    private func configureCardView() -> UIView {
        let view = UIView()
        
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let imageViewConstraints = [
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ]
        NSLayoutConstraint.activate(imageViewConstraints)
        
        return view
    }
}
