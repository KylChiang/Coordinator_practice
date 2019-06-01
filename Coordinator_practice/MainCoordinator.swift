//
//  MainCoordinator.swift
//  Coordinator_practice
//
//  Created by Kyl Chiang on 2019/5/16.
//  Copyright © 2019 Play4Act Studio. All rights reserved.
//

import UIKit

// https://www.hackingwithswift.com/articles/71/how-to-use-the-coordinator-pattern-in-ios-apps
class MainCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {    // It’s a class rather than a struct because this coordinator will be shared across many view controllers.
    var childCoordinators: [Coordinator] = [Coordinator] ()

    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        navigationController.delegate = self
        
        let vc = ViewController.instantiate()
        vc.coordinator = self  // set the coordinator property of our iniital view controller, so it's able to send messages when its buttons are tapped.
        navigationController.pushViewController(vc, animated: true)
    }
    
    func buySubscription() {
        let child = BuyCoordinator(navigationController: navigationController)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
    
    func createAccount() {
        let vc = CreateAccountViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }
        
        if navigationController.viewControllers.contains(fromViewController) { // means push different view controller on top, and then poping
            return
        }
        
        if let buyViewController = fromViewController as? BuyViewController {
            childDidFinish(buyViewController.coordinator)
        }
        
    }
}
