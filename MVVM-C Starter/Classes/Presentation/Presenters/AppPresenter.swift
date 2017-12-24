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
        // if signed in
        showApp()
        // showLoadScreen()
        // else
        // showOnboarding(animated: true)
    }
    
    func showLoadScreen() {
        // create loading view controller if needed
    }
    
    func showApp() {
        let rootCoordinator = RootPresenter(rootViewController: self.rootViewController)
        //rootCoordinator.delegate = self
        self.childPresenters.add(rootCoordinator)
        rootCoordinator.start(animated: true)
    }
    
    func showOnboarding(animated: Bool) {
        
    }
    
}

// ++ Initial loading delegate methods
// ...

// ++ User onboard delegate methods
// ...


// Root presenter delegate methods
extension AppPresenter: RootDelegate {
    
    func rootPresenterDidFinishLaunching() {
        
    }
    
    func userLoggedOut(_ presenter: AnyObject) {
        
    }
}

