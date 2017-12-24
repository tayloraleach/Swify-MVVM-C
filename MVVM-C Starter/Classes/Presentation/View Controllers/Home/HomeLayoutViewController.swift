//
//  HomeLayoutViewController.swift
//  MVVM-C Starter
//
//  Created by Taylor on 2017-12-23.
//  Copyright © 2017 Taylor. All rights reserved.
//

import UIKit

class HomeLayoutViewController: UIViewController {
    
    var tabsViewController: HomeTabsViewController!
    
    init(tabsViewController: HomeTabsViewController) {
        self.tabsViewController = tabsViewController
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Home"
        view.backgroundColor = .white
    }

}
