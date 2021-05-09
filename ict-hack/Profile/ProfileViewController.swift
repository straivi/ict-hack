//
//  ProfileViewController.swift
//  ict-hack
//
//  Created by  Matvey on 09.05.2021.
//

import UIKit

class ProfileViewController: UIViewController {
    private let header = ProfileHeaderView()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setupLayout()
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    private func setupLayout() {
        var constraints = [NSLayoutConstraint]()
        
        view.addSubview(header)
        header.translatesAutoresizingMaskIntoConstraints = false
        let headerConstraints = [
            header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            header.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            header.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ]
        constraints += headerConstraints
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setupViews() {
        //Main view
//        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .white
        
    }
}
