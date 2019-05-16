//
//  MainCoordinator.swift
//  Coordinator_practice
//
//  Created by Kyl Chiang on 2019/5/16.
//  Copyright © 2019 Play4Act Studio. All rights reserved.
//

import UIKit

class MainCoordinator: Coordinator {    // It’s a class rather than a struct because this coordinator will be shared across many view controllers.
    var childCoordinators: [Coordinator] = [Coordinator] ()

    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = ViewController.instantiate()
        navigationController.pushViewController(vc, animated: true)
    }
}
