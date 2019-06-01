//
//  MainTabViewController.swift
//  Coordinator_practice
//
//  Created by Kyl Chiang on 2019/6/1.
//  Copyright © 2019 Play4Act Studio. All rights reserved.
//

import UIKit

class MainTabViewController: UITabBarController {
    let main = MainCoordinator(navigationController: UINavigationController())
    

    override func viewDidLoad() {
        super.viewDidLoad()

        main.start()
        viewControllers = [main.navigationController]
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
