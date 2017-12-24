//
//  RootNavigationCoordinator.swift
//  MVVM-C Starter
//
//  Created by Taylor on 2017-12-23.
//  Copyright © 2017 Taylor. All rights reserved.
//

import Foundation
import UIKit

final class RootNavigationCoordinator: Coordinator, NavigationCoordinator {
    
    enum Tab {
        case home, search, settings
    }
    
    enum Transition: TransitionType {
        case toTab(Tab)   
    }

    override var rootViewController: UIViewController {
        return rootController
    }
    
    private let parentController: UIViewController
    private let rootController: UITabBarController
    private let rootControllerViewModel: RootControllerViewModel
    
    weak var delegate: RootDelegate?
    
    private var selectedCoordinator: TabCoordinatorType?
    
    required init(rootViewController: UIViewController, tabCoordinators: [TabCoordinatorType]) {
        self.parentController = rootViewController
        self.rootController = UITabBarController()
        self.rootControllerViewModel = RootControllerViewModel()
        super.init()
        
        childCoordinators = tabCoordinators
        rootController.delegate = rootControllerViewModel
        rootControllerViewModel.navigationCoordinator = self
        selectedCoordinator = tabCoordinators.first
    }
    
    override func start(animated: Bool) {
        setupRootController(animated: animated)
        delegate?.rootPresenterDidFinishLaunching()
    }
    
    private func setupRootController(animated: Bool) {
        let coordinatorControllers = childCoordinators.map { $0.rootViewController }
        rootController.viewControllers = coordinatorControllers
        
        // Brings the title a bit closer to the icon
        let verticalAdjustment: CGFloat = -2
        UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: 0, vertical: verticalAdjustment)
        if let navController = parentController as? UINavigationController {
            navController.pushViewController(rootController, animated: animated)
        } else {
            parentController.present(rootController, animated: animated, completion: nil)
        }
    }
    
    func performTransition(_ transition: TransitionType) {
        guard let transition = transition as? RootNavigationCoordinator.Transition else { return }

        switch transition {
        case .toTab(let tab):
            select(tab: tab)
            // If you need to transition to a nested view
        }
    }
    
    private func select(tab: Tab) {
        selectedCoordinator = getCoordinator(for: tab)
        rootController.switchToTab(tab)
    }
    
    private func getCoordinator(for tab: Tab) -> TabCoordinatorType? {
        return childCoordinators.filter {
            switch tab {
            case .home:
                return $0 is HomeNavigationCoordinator
            case .search:
                return $0 is SearchNavigationCoordinator
            case .settings:
                return $0 is SettingsNavigationCoordinator
            }
        }.first as? TabCoordinatorType
    }
}

extension UITabBarController {
    
    func tab(for viewController: UIViewController) -> RootNavigationCoordinator.Tab? {
        if let navController = viewController as? UINavigationController {
            return tab(for: navController.viewControllers.first!)
        }
        switch viewController {
        case is HomeViewController:
            return .home
        case is SearchViewController:
            return .search
        case is SettingsViewController:
            return .settings
        default:
            return nil
        }
    }
    
    func switchToTab(_ tab: RootNavigationCoordinator.Tab) {
        guard let viewController = viewControllers?.filter({ (viewController) -> Bool in
            switch tab {
            case .home:
                return contains(viewController: viewController, of: HomeViewController.self)
            case .search:
                return contains(viewController: viewController, of: SearchViewController.self)
            case .settings:
                return contains(viewController: viewController, of: SettingsViewController.self)
            }
        }).first else { return }
        selectedViewController = viewController
    }
    
    private func contains<T>(viewController: UIViewController, of type: T.Type) -> Bool {
        if let navController = viewController as? UINavigationController {
            return navController.viewControllers.filter { $0 is T }.count > 0
        }
        return viewController is T
    }
}
