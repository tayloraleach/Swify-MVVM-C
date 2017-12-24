//
//  HomeNavigationCoordinator.swift
//  MVVM-C Starter
//
//  Created by Taylor on 2017-12-23.
//  Copyright © 2017 Taylor. All rights reserved.
//

import Foundation
import UIKit

final class HomeNavigationCoordinator: Coordinator, TabCoordinatorType, NavigationCoordinator {
    
    override var rootViewController: UIViewController {
        return rootController
    }
    
    private var rootController: UINavigationController!
    private var homeController: HomeLayoutViewController!
    private let tabsController: HomeTabsViewController
    
    let tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.featured, tag: 1)
    
    override init() {
        tabsController = HomeTabsViewController()
        super.init()
        homeController = HomeLayoutViewController(tabsViewController: tabsController)
        rootController = UINavigationController(rootViewController: homeController)
        rootController.tabBarItem = tabBarItem
    }
    
    func performTransition(_ transition: TransitionType) {
        
    }

}

