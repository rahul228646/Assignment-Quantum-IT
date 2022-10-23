//
//  MainTabBarViewController.swift
//  assignment
//
//  Created by rahul kaushik on 21/10/22.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        let vc1 = UINavigationController(rootViewController: CartViewController())
        let vc2 = UINavigationController(rootViewController: CartViewController())
        let vc3 = UINavigationController(rootViewController: CartViewController())
        let vc4 = UINavigationController(rootViewController: CartViewController())
        let vc5 = UINavigationController(rootViewController: CartViewController())
        
//        UITabBar.appearance().tintColor = UIColor.red
        
        vc1.tabBarItem.image = UIImage(systemName: "house.fill")
        vc2.tabBarItem.image = UIImage(systemName: "heart.fill")
        vc3.tabBarItem.image = UIImage(systemName: "bell.fill")
        vc4.tabBarItem.image = UIImage(systemName: "person.fill")
        vc5.tabBarItem.image = UIImage(systemName: "cart.fill")
        
        vc1.title = "Home"
        vc2.title = "Saved"
        vc3.title = "Notification"
        vc4.title = "Profile"
        vc5.title = "Cart"
        
        tabBar.tintColor = .systemRed
        
        setViewControllers([vc1, vc2, vc3, vc4, vc5], animated: true)
    }
    



}
