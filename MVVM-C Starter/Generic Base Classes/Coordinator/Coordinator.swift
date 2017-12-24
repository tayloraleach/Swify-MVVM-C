//
//  Coordinator.swift
//  MVVM-C Starter
//
//  Created by Taylor on 2017-12-23.
//  Copyright © 2017 Taylor. All rights reserved.
//


import Foundation
import UIKit

// Protocols
// ------------------------------------------------------------------------
protocol Transitionable: class {
    weak var navigationCoordinator: NavigationCoordinator? { get set }
}

protocol NavigationCoordinator: class {
    func performTransition(_ transition: TransitionType)
}

protocol TransitionType { }

protocol TabCoordinatorType: CoordinatorType {
    var tabBarItem: UITabBarItem { get }
}

protocol CoordinatorType: class {
    
    var rootViewController: UIViewController { get }
    
    var childCoordinators: [CoordinatorType] { get set }
    weak var presentedCoordinator: CoordinatorType? { get set }
    weak var presentingCoordinator: CoordinatorType? { get set }
    
    func start(animated: Bool)
    func dismiss(animated: Bool)
    func dismissAllModals(animated: Bool)
    func present(_ coordinator: CoordinatorType, animated: Bool)
}

// Coordinator class
// ------------------------------------------------------------------------
public class Coordinator: CoordinatorType {
    
    var rootViewController: UIViewController {
        fatalError("not implemented")
    }
    var childCoordinators: [CoordinatorType] = []
    weak var presentedCoordinator: CoordinatorType? = nil
    weak var presentingCoordinator: CoordinatorType? = nil
    
    var topCoordinator: Coordinator {
        guard let presentedCoordinator = self.presentedCoordinator as? Coordinator else {
            return self
        }
        return presentedCoordinator.topCoordinator
    }
    
    func start(animated: Bool) {
        fatalError("not implemented")
    }
    
    func present(_ coordinator: CoordinatorType, animated: Bool) {
        coordinator.presentingCoordinator = self
        coordinator.start(animated: animated)
        addCoordinator(coordinator)
        presentedCoordinator = coordinator
    }
    
    func dismiss(animated: Bool) {
        rootViewController.dismiss(animated: animated, completion: nil)
        if let presentingCoordinator = self.presentingCoordinator as? Coordinator {
            presentingCoordinator.removeCoordinator(self)
        }
    }
    
    func dismissAllModals(animated: Bool) {
        if let presentedCoordinator = presentedCoordinator {
            presentedCoordinator.dismiss(animated: animated)
        }
        if let presentedController = rootViewController.presentedViewController {
            presentedController.dismiss(animated: animated, completion: nil)
        }
    }
    
    func addCoordinator(_ coordinator: CoordinatorType) {
        childCoordinators.append(coordinator)
    }
    
    func removeCoordinator(_ coordinator: CoordinatorType) {
        childCoordinators = childCoordinators.filter { $0 !== coordinator }
    }
    
    func removeAllCoordinators() {
        childCoordinators.removeAll()
    }
}
