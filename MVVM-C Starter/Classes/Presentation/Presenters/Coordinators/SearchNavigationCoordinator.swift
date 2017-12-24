//
//  SearchNavigationCoordinator.swift
//  MVVM-C Starter
//
//  Created by Taylor on 2017-12-23.
//  Copyright © 2017 Taylor. All rights reserved.
//


import Foundation
import UIKit


final class SearchNavigationCoordinator: Coordinator, NavigationCoordinator, TabCoordinatorType {

    let tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.search, tag: 2)
    
    override var rootViewController: UIViewController {
        return rootController
    }
    
    let rootController: UINavigationController
    
    override init() {
        let vc = SearchViewController()
        rootController = UINavigationController(rootViewController: vc)
        rootController.tabBarItem = tabBarItem
        super.init()
    }

    func performTransition(_ transition: TransitionType) {
        
    }

//
//    func performTransition(_ transition: TransitionType) {
//        guard let transition = transition as? Transition else { return }
//        switch transition {
//        case .toOffer(let offer, let venue):
//            showDetailForOffer(offer, venue: venue)
//        case .toVenue(let venue):
//            showDetailForVenue(venue)
//        }
//    }

}
