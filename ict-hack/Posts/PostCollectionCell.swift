//
//  PostCollectionCell.swift
//  ict-hack
//
//  Created by  Matvey on 08.05.2021.
//

import UIKit
import MaterialComponents.MaterialChips

class PostCollectionCell: UICollectionViewCell {
    
    private let titleLabel = UILabel()
    private let authorLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let experienceLabel = UILabel()
    private let flowLayout = UICollectionViewFlowLayout()
    private let tagsCollectionView: UICollectionView
    
    private var tagsList = [String]()
    
    override init(frame: CGRect) {
        tagsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        super.init(frame: frame)
        setupLayout()
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        var constraints = [NSLayoutConstraint]()
        
        //Ttile
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        let titleConstraints = [
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 28),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24)
        ]
        constraints += titleConstraints
        
        //Experience
        contentView.addSubview(experienceLabel)
        experienceLabel.translatesAutoresizingMaskIntoConstraints = false
        let experienceConstraints = [
            experienceLabel.topAnchor.constraint(equalTo: titleLabel.topAnchor),
            experienceLabel.leadingAnchor.constraint(greaterThanOrEqualTo: titleLabel.trailingAnchor, constant: 24),
            experienceLabel.bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            experienceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24)
        ]
        constraints += experienceConstraints
        
        //Author
        contentView.addSubview(authorLabel)
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        let authorConstraints = [
            authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            authorLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            authorLabel.trailingAnchor.constraint(equalTo: experienceLabel.trailingAnchor)
        ]
        constraints += authorConstraints
        
        //Description
        contentView.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        let descriptionConstraints = [
            descriptionLabel.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 12),
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: experienceLabel.trailingAnchor)
        ]
        constraints += descriptionConstraints
        
        //Tags collection view
        contentView.addSubview(tagsCollectionView)
        tagsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        let tagsCollectionConstraints = [
            tagsCollectionView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 25),
            tagsCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            tagsCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            tagsCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            tagsCollectionView.heightAnchor.constraint(equalToConstant: 22)
        ]
        constraints += tagsCollectionConstraints
        
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setupViews() {
        contentView.backgroundColor = .white
        
        //Title
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        titleLabel.textAlignment = .left
        titleLabel.numberOfLines = 1
        titleLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        
        //Author
        authorLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        authorLabel.textAlignment = .left
        authorLabel.numberOfLines = 1
        authorLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
        
        //Description
        descriptionLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        descriptionLabel.setContentHuggingPriority(.defaultLow, for: .vertical)
        descriptionLabel.textAlignment = .left
        descriptionLabel.numberOfLines = 5
        descriptionLabel.textColor = UIColor.label.secondaryText
        
        //Experience
        experienceLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        experienceLabel.textAlignment = .right
        experienceLabel.numberOfLines = 1
        experienceLabel.textColor = UIColor.label.accentText
        experienceLabel.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        
        //Shadow
        layer.shadowColor = UIColor.black.withAlphaComponent(0.18).cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 16
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: contentView.layer.cornerRadius).cgPath
        
        //Tag collection view
        tagsCollectionView.dataSource = self
        tagsCollectionView.delegate = self
        tagsCollectionView.register(TagCollectionCell.self, forCellWithReuseIdentifier: String(describing: TagCollectionCell.self))
        tagsCollectionView.backgroundColor = .clear
        tagsCollectionView.showsHorizontalScrollIndicator = false
        tagsCollectionView.contentOffset = CGPoint(x: -20, y: 0)
        
        //Flow layout
        flowLayout.scrollDirection = .horizontal
    }
    
    func configureCell(model: Proposal) {
        titleLabel.text = model.name
        authorLabel.text = model.author
        descriptionLabel.text = model.description
        experienceLabel.text = "+\(model.value) R"
        tagsList = model.tags
        
        tagsCollectionView.reloadData()
    }
}

// MARK: UICollectionViewDelegateFlowLayout
extension PostCollectionCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: TagCollectionCell.self), for: indexPath) as? TagCollectionCell else { return .zero }
        cell.configureCell(item: indexPath.item, tags: tagsList)
        return CGSize(width: cell.chipView.intrinsicContentSize.width, height: 22)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 22, bottom: 0, right: 10)
    }
    
    
}

// MARK: UICollectionViewDataSource
extension PostCollectionCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        tagsList.count
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: TagCollectionCell.self), for: indexPath) as? TagCollectionCell else { return TagCollectionCell() }
        cell.configureCell(item: indexPath.item, tags: tagsList)
        return cell
    }
    
}
