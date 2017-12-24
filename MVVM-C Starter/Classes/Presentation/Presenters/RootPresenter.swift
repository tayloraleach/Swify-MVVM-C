//
//  RootPresenter.swift
//  MVVM-C Starter
//
//  Created by Taylor on 2017-12-23.
//  Copyright © 2017 Taylor. All rights reserved.
//

import Foundation
import UIKit

@objc protocol RootDelegate: class {
    func rootPresenterDidFinishLaunching()
    func userLoggedOut(_ presenter: AnyObject)
}

final class RootPresenter: NSObject {

    let rootNavCoordinator: RootNavigationCoordinator
    
    weak var delegate: RootDelegate? {
        get {
            return rootNavCoordinator.delegate
        }
        set {
            rootNavCoordinator.delegate = newValue
        }
    }
    
    required init(rootViewController: UIViewController) {
        let homeNavCoordinator = HomeNavigationCoordinator()
        let searchCoordinator = SearchNavigationCoordinator()
        let settingsCoordinator = SettingsNavigationCoordinator()
        
        rootNavCoordinator = RootNavigationCoordinator(rootViewController: rootViewController, tabCoordinators: [homeNavCoordinator, searchCoordinator, settingsCoordinator])
        super.init()
    }
    
    func start(animated: Bool) {
        rootNavCoordinator.start(animated: animated)
    }
    
}
