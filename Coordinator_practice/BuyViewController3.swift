//
//  BuyViewController3.swift
//  Coordinator_practice
//
//  Created by Kyl Chiang on 2019/6/2.
//  Copyright © 2019 Play4Act Studio. All rights reserved.
//

import UIKit

class BuyViewController3: UIViewController, Storyboarded {
    weak var coordinator: BuyCoordinator3?

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        coordinator?.didFinishBuying()
    }
    
    @IBAction func tappedNextButton(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
}
