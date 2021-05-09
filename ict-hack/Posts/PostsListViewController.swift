//
//  PostsListViewController.swift
//  ict-hack
//
//  Created by  Matvey on 08.05.2021.
//

import UIKit

class PostsListViewController: UIViewController {
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    private let sectionInsets = UIEdgeInsets(top: 40, left: 20, bottom: 40, right: 20)
    private let itemsPerRow: CGFloat = 1
    
    private var proposalsList = [Proposal]()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setupView()
        setupLayout()
        getProposalsList()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        var constraints = [NSLayoutConstraint]()
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        let collectionViewConstraints = [
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ]
        constraints += collectionViewConstraints
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setupView() {
        collectionView.backgroundColor = .white
        
        collectionView.register(PostCollectionCell.self, forCellWithReuseIdentifier: String(describing: PostCollectionCell.self))
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func getProposalsList() {
        let networkService = NetworkService()
        networkService.getProposalList { (result) in
            switch result {
            case .success(let newProposals):
                self.proposalsList = newProposals
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
                
            default:
                break
            }
            
        }
    }
    
}

// MARK: UICollectionViewDelegateFlowLayout
extension PostsListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem * 0.75)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        sectionInsets.left
    }
}

// MARK: UICollectionViewDataSource
extension PostsListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        proposalsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: PostCollectionCell.self), for: indexPath) as? PostCollectionCell else { return PostCollectionCell() }
        cell.configureCell(model: proposalsList[indexPath.item])
        return cell
    }
}

extension PostsListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = PostDetailViewController()
        
        present(detailVC, animated: true)
    }
}
