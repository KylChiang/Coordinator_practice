//
//  ViewController.swift
//  Coordinator_practice
//
//  Created by Kyl Chiang on 2019/5/16.
//  Copyright © 2019 Play4Act Studio. All rights reserved.
//

import UIKit

class ViewController: UIViewController, Storyboarded {

    // 以下註解等同#15, #16
//    weak var coordinator: (Buying & AccountCreating)?
    var buyAction: (() -> Void)?
    var createAcountAction: (() -> Void)?
    
    @IBOutlet weak var product: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buyTapped(_ sender: Any) {
        buyAction?()
    }
    
    @IBAction func createAccountTapped(_ sender: Any) {
        createAcountAction?()
    }
}

