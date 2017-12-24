//
//  AppPresenter.swift
//  MVVM-C Starter
//
//  Created by Taylor on 2017-12-23.
//  Copyright © 2017 Taylor. All rights reserved.
//

import Foundation
import UIKit


class AppPresenter {
    
    let rootViewController: UIViewController
    let childPresenters: NSMutableArray

    init(rootViewController: UIViewController) {
        self.rootViewController = rootViewController
        self.childPresenters = []
    }
    
    func start() {
        // if user is signed in
        showApp() // or showLoadingScreen()
        // else
        // showOnboarding(animated: true)
    }
    
    // create loading view controller if needed
    func showLoadingScreen() { }
    func showOnboarding(animated: Bool) { }
    
    func showApp() {
        let rootCoordinator = RootPresenter(rootViewController: self.rootViewController)
        rootCoordinator.delegate = self
        self.childPresenters.add(rootCoordinator)
        rootCoordinator.start(animated: true)
    }
}

// Root presenter delegate methods
extension AppPresenter: RootDelegate {
    
    func rootPresenterDidFinishLaunching() {
        
    }
    
    func userLoggedOut(_ presenter: AnyObject) {
        
    }
}

