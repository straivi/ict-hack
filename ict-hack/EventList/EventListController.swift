//
//  ViewController.swift
//  ict-hack
//
//  Created by  Matvey on 07.05.2021.
//

import UIKit
import AppstoreTransition

class EventListController: UIViewController {
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    private let sectionInsets = UIEdgeInsets(top: 40, left: 20, bottom: 40, right: 20)
    private let itemsPerRow: CGFloat = 1
    
    private var transition: CardTransition?
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setupLayout()
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func setupLayout() {
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        let collectionConstraints: [NSLayoutConstraint] = [
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(collectionConstraints)
    }
    
    private func setupViews() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ExpandableCollectionCell.self, forCellWithReuseIdentifier: String(describing: ExpandableCollectionCell.self))
        
        collectionView.backgroundColor = .white
    }
    
    
    
}

// MARK: UICollectionViewDelegate
extension EventListController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ExpandableCollectionCell.self), for: indexPath) as? ExpandableCollectionCell else { return }
        cell.settings.cardContainerInsets = sectionInsets
        transition = CardTransition(cell: cell, settings: cell.settings)
        let detailController = EventDetailViewController()
        detailController.settings = cell.settings
        detailController.transitioningDelegate = transition
        detailController.modalPresentationStyle = .custom
        
        presentExpansion(detailController, cell: cell, animated: true)
    }
}

// MARK: UICollectionViewDataSource
extension EventListController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ExpandableCollectionCell.self), for: indexPath) as? ExpandableCollectionCell else { return UICollectionViewCell() }
        return cell
    }
    
    
}

// MARK: UICollectionViewDelegateFlowLayout
extension EventListController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        sectionInsets.left
    }
}
