//
//  PostDetailViewController.swift
//  ict-hack
//
//  Created by  Matvey on 08.05.2021.
//

import UIKit

class PostDetailViewController: UIViewController {
    private let headerImage = UIImageView(image: AppImage.sampleImage)
    private let titleLabel = UILabel()
    private let authorLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let experienceLabel = UILabel()
    private let rewardTitleLabel = UILabel()
    private let rewardTextLabel = UILabel()
    private let rewardCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    private let responseButton = UIButton(type: .system)
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setupLayout()
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        
        var constraints = [NSLayoutConstraint]()
        
        //ScrollView
        let scrollView = UIScrollView()
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        let scrollViewConstraints = [
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ]
        constraints += scrollViewConstraints
        
        //Header
        scrollView.addSubview(headerImage)
        headerImage.translatesAutoresizingMaskIntoConstraints = false
        let headerConstraints = [
            headerImage.topAnchor.constraint(equalTo: scrollView.topAnchor),
            headerImage.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            headerImage.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            headerImage.widthAnchor.constraint(equalTo: view.widthAnchor),
            headerImage.heightAnchor.constraint(equalTo: headerImage.widthAnchor)
        ]
        constraints += headerConstraints
        
        //Title
        scrollView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        let titleLabelConstraints = [
            titleLabel.topAnchor.constraint(equalTo: headerImage.bottomAnchor, constant: 32),
            titleLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 24)
        ]
        constraints += titleLabelConstraints
        
        //Experience
        scrollView.addSubview(experienceLabel)
        experienceLabel.translatesAutoresizingMaskIntoConstraints = false
        let experienceConstraints = [
            experienceLabel.topAnchor.constraint(equalTo: titleLabel.topAnchor),
            experienceLabel.leadingAnchor.constraint(greaterThanOrEqualTo: titleLabel.trailingAnchor, constant: 24),
            experienceLabel.bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            experienceLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -24)
        ]
        constraints += experienceConstraints
        
        //Author
        scrollView.addSubview(authorLabel)
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        let authorConstraints = [
            authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            authorLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            authorLabel.trailingAnchor.constraint(equalTo: experienceLabel.trailingAnchor)
        ]
        constraints += authorConstraints
        
        //Description container
        let descriptionContainerView = UIView()
        scrollView.addSubview(descriptionContainerView)
        descriptionContainerView.translatesAutoresizingMaskIntoConstraints = false
        let descriptionContainerConstraints = [
            descriptionContainerView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 12),
            descriptionContainerView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionContainerView.trailingAnchor.constraint(equalTo: experienceLabel.trailingAnchor)
        ]
        constraints += descriptionContainerConstraints
        
        //Description
        descriptionContainerView.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        let descriptionConstraints = [
            descriptionLabel.topAnchor.constraint(equalTo: descriptionContainerView.topAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: descriptionContainerView.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: descriptionContainerView.trailingAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: descriptionContainerView.bottomAnchor),
        ]
        constraints += descriptionConstraints
        
        //Reward title
        scrollView.addSubview(rewardTitleLabel)
        rewardTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        let rewardTitleConstraints = [
            rewardTitleLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 27),
            rewardTitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            rewardTitleLabel.trailingAnchor.constraint(equalTo: experienceLabel.trailingAnchor)
        ]
        constraints += rewardTitleConstraints
        
        //Reward text
        scrollView.addSubview(rewardTextLabel)
        rewardTextLabel.translatesAutoresizingMaskIntoConstraints = false
        let rewardTextConstraints = [
            rewardTextLabel.topAnchor.constraint(equalTo: rewardTitleLabel.bottomAnchor, constant: 8),
            rewardTextLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            rewardTextLabel.trailingAnchor.constraint(equalTo: experienceLabel.trailingAnchor),
//            rewardTextLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -20)
        ]
        constraints += rewardTextConstraints
        
        //Reward collection
//        scrollView.addSubview(rewardCollectionView)
        
        //Response button
        scrollView.addSubview(responseButton)
        responseButton.translatesAutoresizingMaskIntoConstraints = false
        let responseButtonConstraints = [
            responseButton.topAnchor.constraint(equalTo: rewardTextLabel.bottomAnchor, constant: 40),
            responseButton.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            responseButton.trailingAnchor.constraint(equalTo: experienceLabel.trailingAnchor),
            responseButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -30),
            responseButton.heightAnchor.constraint(equalToConstant: 50)
        ]
        constraints += responseButtonConstraints
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setupViews() {
        view.backgroundColor = UIColor.view.secondaryBackground
        
        
        //Ttile
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        titleLabel.text = "Ищу дизайнера"
        titleLabel.textAlignment = .left
        titleLabel.numberOfLines = 1
        
        //Author
        authorLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        authorLabel.text = "Case Club, ИТМО"
        authorLabel.textAlignment = .left
        authorLabel.numberOfLines = 1
        
        //Description
        descriptionLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        descriptionLabel.text = "Девятиклассник Михаил Пивнев зашёл в здание «Образовательного центра № 1», обучающимся которого являлся, где открыл стрельбу из пневматической винтовки, а затем взорвал самодельные взрывные устройства. В результате атаки пострадали 4 человека — учительница информатики, которой подросток нанёс удар секачом по голове и выстрелил в лицо, а также трое учеников школы, выпрыгнувших из окна здания учебного заведения. Пивнев был задержан сотрудниками правоохранительных органов. Психолого-психиатрическая экспертиза установила вменяемость подростка на момент совершения нападения."
        descriptionLabel.textAlignment = .left
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textColor = UIColor.label.secondaryText
        
        //Experience
        experienceLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        experienceLabel.textAlignment = .right
        experienceLabel.numberOfLines = 1
        experienceLabel.textColor = UIColor.label.accentText
        experienceLabel.text = "+5 R"
        
        //Reward title
        rewardTitleLabel.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        rewardTitleLabel.textAlignment = .left
        rewardTitleLabel.text = "Награды"
        
        //Reward text
        rewardTextLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        rewardTextLabel.text = "За первое место чел получает супер приз"
        rewardTextLabel.textColor = UIColor.label.secondaryText
        
        //Header
        headerImage.clipsToBounds = true
        let gradientLayer = CAGradientLayer()
//        headerImage.layer.addSublayer(gradientLayer)
        gradientLayer.type = .axial
//        gradientLayer.frame = headerImage.frame
        gradientLayer.colors = [UIColor.red.cgColor ,UIColor.blue.cgColor]
        gradientLayer.locations = [0, 1]
//        gradientLayer.startPoint = CGPoint(x: 0, y: 0.75)
//        gradientLayer.endPoint = CGPoint(x: 0, y: 0.25)
        
//        gradientLayer.position = headerImage.center
        
//        gradientLayer.frame = headerImage.bounds
        
        headerImage.layer.insertSublayer(gradientLayer, at: 0)
        
        //Response button
        responseButton.setTitle("Оставить заявку", for: .normal)
        responseButton.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        responseButton.setTitleColor(.white, for: .normal)
        responseButton.backgroundColor = UIColor.button.primaryBackground
        responseButton.layer.cornerRadius = 12
    }
}
