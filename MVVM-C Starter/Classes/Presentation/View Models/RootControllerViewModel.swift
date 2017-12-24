//
//  RootControllerViewModel.swift
//  MVVM-C Starter
//
//  Created by Taylor on 2017-12-23.
//  Copyright © 2017 Taylor. All rights reserved.
//

import UIKit

final class RootControllerViewModel: NSObject, UITabBarControllerDelegate, Transitionable {
    
    var navigationCoordinator: NavigationCoordinator?
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if let tab = tabBarController.tab(for: viewController) {
            navigationCoordinator?.performTransition(RootNavigationCoordinator.Transition.toTab(tab))
        }
        return false
    }
}
