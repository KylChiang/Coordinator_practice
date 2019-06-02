//
//  BuyViewController.swift
//  Coordinator_practice
//
//  Created by Kyl Chiang on 2019/5/16.
//  Copyright © 2019 Play4Act Studio. All rights reserved.
//

import UIKit

class BuyViewController: UIViewController, Storyboarded {
    weak var coordinator: BuyCoordinator?
    
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
//        coordinator?.didFinishBuying()
    }
    
    @IBAction func tapeedNextButton(_ sender: Any) {
//        navigationController?.popViewController(animated: true)
        coordinator?.goNext()
    }
    
}
