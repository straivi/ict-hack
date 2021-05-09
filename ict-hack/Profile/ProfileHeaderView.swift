//
//  ProfileHeaderView.swift
//  ict-hack
//
//  Created by  Matvey on 09.05.2021.
//

import UIKit

class ProfileHeaderView: UIView {
    private let profileImage = UIImageView()
    private let nameLabel = UILabel()
    private let expBar = UIProgressView()
    private let expLabel = UILabel()
    private let ratingButton = UIButton()
    private let settingsButton = UIButton()
    
    init() {
        super.init(frame: .zero)
        setupLayout()
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        var constraints = [NSLayoutConstraint]()
        
        //Profile image
        addSubview(profileImage)
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        let profileImageConstraints = [
            profileImage.topAnchor.constraint(equalTo: topAnchor, constant: 45),
            profileImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            profileImage.heightAnchor.constraint(equalToConstant: 72),
            profileImage.widthAnchor.constraint(equalTo: profileImage.heightAnchor),
            profileImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40)
        ]
        constraints += profileImageConstraints
        
        //Name label
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        let nameLabelConstraints = [
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            nameLabel.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 24),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -47),
            
        ]
        constraints += nameLabelConstraints
        
        //Settings button
        addSubview(settingsButton)
        settingsButton.translatesAutoresizingMaskIntoConstraints = false
        let settingsButtonConstraints = [
            settingsButton.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            settingsButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -17)
        ]
        constraints += settingsButtonConstraints
        
        //Progress view
        addSubview(expBar)
        expBar.translatesAutoresizingMaskIntoConstraints = false
        let expBarConstraints = [
            expBar.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 16),
            expBar.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            expBar.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
        ]
        constraints += expBarConstraints
        
        //Exp label
        addSubview(expLabel)
        expLabel.translatesAutoresizingMaskIntoConstraints = false
        let expLabelConstraints = [
            expLabel.topAnchor.constraint(equalTo: expBar.bottomAnchor, constant: 6),
            expLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor)
        ]
        constraints += expLabelConstraints
        
        //Rating button
        addSubview(ratingButton)
        ratingButton.translatesAutoresizingMaskIntoConstraints = false
        let ratingButtonConstraints = [
            ratingButton.topAnchor.constraint(equalTo: expBar.bottomAnchor, constant: 6),
            ratingButton.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor)
        ]
        constraints += ratingButtonConstraints
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setupViews() {
        //View
        backgroundColor = .white
        
        //Profile image
        profileImage.layer.cornerRadius = 36
        profileImage.backgroundColor = .lightGray
        
        //Name label
        nameLabel.text = "Матвеева Светлана"
        nameLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        
        //Exp bar
        expBar.progress = 0.75
        expLabel.tintColor = UIColor.label.accentText
        
        //Exp label
        expLabel.text = "75 / 100"
        expLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        expLabel.textColor = UIColor.label.secondaryText
        
        //Rating button
        ratingButton.setTitle("Рейтинг", for: .normal)
        ratingButton.setTitleColor(UIColor.label.accentText, for: .normal)
        ratingButton.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        
        //Settings button
        settingsButton.setImage(UIImage(systemName: "gearshape"), for: .normal)
        settingsButton.tintColor = UIColor.label.secondaryText
    }
    
}
