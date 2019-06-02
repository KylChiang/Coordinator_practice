//
//  MainCoordinator.swift
//  Coordinator_practice
//
//  Created by Kyl Chiang on 2019/5/16.
//  Copyright © 2019 Play4Act Studio. All rights reserved.
//

import UIKit

// https://www.hackingwithswift.com/articles/71/how-to-use-the-coordinator-pattern-in-ios-apps
//  https://www.hackingwithswift.com/articles/175/advanced-coordinator-pattern-tutorial-ios
class MainCoordinator: NSObject, Coordinator, UINavigationControllerDelegate, AccountCreating, Buying {

    // It’s a class rather than a struct because this coordinator will be shared across many view controllers.
    var childCoordinators: [Coordinator] = [Coordinator] ()

    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        navigationController.delegate = self
        
        let vc = ViewController.instantiate()
        vc.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        
        vc.buyAction = { [weak self] in
            self?.buySubscription()
        }
        
        vc.createAcountAction = { [weak self] in
            self?.createAccount(to: 3)
        }
        
        navigationController.pushViewController(vc, animated: true)
    }
    
    func buySubscription() {
        let child = BuyCoordinator(navigationController: navigationController)
        child.parentCoordinator = self
        childCoordinators.append(child)
        
        child.start()
    }
    
    func createAccount(to productType: Int) {
        let vc = CreateAccountViewController.instantiate()
        vc.selectProduct = productType
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
