//
//  Coordinator.swift
//  Coordinator_practice
//
//  Created by Kyl Chiang on 2019/5/16.
//  Copyright © 2019 Play4Act Studio. All rights reserved.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }                // for expand them
    var navigationController: UINavigationController { get set }    // for present them
    
    func start()    // to create a coordinator fully and activate it only when we 're ready.
}
