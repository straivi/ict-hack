//
//  EventDetailViewController.swift
//  ict-hack
//
//  Created by  Matvey on 08.05.2021.
//

import UIKit
import AppstoreTransition

class EventDetailViewController: UIViewController {
    
    private let imageView = UIImageView()
    private let mainText = UILabel()
    
    private func createScrollView() -> UIScrollView {
        let scrollView = UIScrollView()
        
        scrollView.addSubview(mainText)
        mainText.translatesAutoresizingMaskIntoConstraints = false
        mainText.text = "sdkmclscmksdlc"
        let mainTextConstraints = [
            mainText.topAnchor.constraint(equalTo: scrollView.topAnchor),
            mainText.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            mainText.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            mainText.heightAnchor.constraint(equalToConstant: 30)
        ]
        
        NSLayoutConstraint.activate(mainTextConstraints)
        
        let view = UIView()
        view.backgroundColor = .purple
        scrollView.addSubview(view)
        let viewConstraints = [
            view.topAnchor.constraint(equalTo: mainText.bottomAnchor),
            view.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            view.heightAnchor.constraint(equalToConstant: 300)
        ]
        
        NSLayoutConstraint.activate(mainTextConstraints + viewConstraints)
        
        return scrollView
    }
    
    private func createHeaderView() -> UIView {
        imageView.image = AppImage.sampleImage
        return imageView
    }
}

extension EventDetailViewController: CardDetailViewController {
    
    var cardContentView: UIView {
        createHeaderView()
    }
    
    var scrollView: UIScrollView {
        createScrollView()
    }
    
}
