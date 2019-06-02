//
//  BuyViewController2.swift
//  Coordinator_practice
//
//  Created by Kyl Chiang on 2019/6/2.
//  Copyright © 2019 Play4Act Studio. All rights reserved.
//

import UIKit

class BuyViewController2: UIViewController, Storyboarded {
    weak var coordinator: BuyCoordinator2?

    
    @IBAction func tappedNextButton(_ sender: Any) {
        coordinator?.goNext()
    }
    
}
