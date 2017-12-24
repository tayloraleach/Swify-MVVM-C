//
//  SettingsNavigationCoordinator.swift
//  MVVM-C Starter
//
//  Created by Taylor on 2017-12-23.
//  Copyright © 2017 Taylor. All rights reserved.
//

import Foundation
import UIKit

final class SettingsNavigationCoordinator: Coordinator, TabCoordinatorType, NavigationCoordinator {

    let tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.history, tag: 3)
    
    override var rootViewController: UIViewController {
        return rootController
    }
    
    // Transition to different views from settings tab
    enum Transition: String, TransitionType {
        case home                = "/"
        case editProfile         = "profile"
        case changePassword      = "changePassword"
        case anotherSetting      = "anotherSetting"
    }
    
    let rootController: UINavigationController
    
    override init() {
        let vc = SettingsViewController()
        rootController = UINavigationController(rootViewController: vc)
        rootController.tabBarItem = tabBarItem
        super.init()
    }
    

    func performTransition(_ transition: TransitionType) {
        guard let transition = transition as? Transition else { return }
        switch transition {
        case .home:
            rootController.popToRootViewController(animated: false)
            break
        case .editProfile:
            // let editProfileViewController = EditProfileViewController()
            // rootController.pushViewController(editProfileViewController, animated: false)
            // remove break statement
            break
        case .changePassword:
            // let changePasswordViewController = ChangePasswordViewController()
            // rootController.pushViewController(changePasswordViewController, animated: false)
            // remove break statement
            break
        case .anotherSetting:
            // let anotherSettingViewController = AnotherSettingViewController()
            // rootController.pushViewController(anotherSettingViewController, animated: false)
            // remove break statement
            break
        }
    }
}


