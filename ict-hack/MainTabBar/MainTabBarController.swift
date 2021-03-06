//
//  MainTabBarController.swift
//  ict-hack
//
//  Created by  Matvey on 08.05.2021.
//

import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        setupVC()
    }
    
    private func setupVC() {
        viewControllers = [
            createNavController(for: EventListViewController(), title: "События", image: UIImage(systemName: "bolt.horizontal")),
            createNavController(for: PostsListViewController(), title: "Посты", image: UIImage(systemName: "newspaper")),
            createNavController(for: ProfileViewController(), title: "Профиль", image: UIImage(systemName: "person"))
        ]
        
        tabBar.barTintColor = .white
        if let vc = viewControllers?[1] {
            selectedViewController = vc
        }
    }
    
    private func createNavController(for rootViewController: UIViewController,
                                                      title: String,
                                                      image: UIImage?) -> UIViewController {
            let navController = UINavigationController(rootViewController: rootViewController)
            navController.tabBarItem.title = title
            navController.tabBarItem.image = image
            navController.navigationBar.prefersLargeTitles = true
            rootViewController.navigationItem.title = title
            return navController
        }
}
