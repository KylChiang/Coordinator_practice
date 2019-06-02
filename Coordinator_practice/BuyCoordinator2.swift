//
//  BuyCoordinator2.swift
//  Coordinator_practice
//
//  Created by Kyl Chiang on 2019/6/2.
//  Copyright © 2019 Play4Act Studio. All rights reserved.
//

import UIKit

class BuyCoordinator2: Coordinator {
    weak var parentCoordinator: MainCoordinator?
    
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = BuyViewController2.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func didFinishBuying() {
        parentCoordinator?.childDidFinish(self)
    }
    
    func goNext() {
        let child = BuyCoordinator3(navigationController: navigationController)
        child.parentCoordinator = parentCoordinator
        childCoordinators.append(child)
        child.start()
    }
}
