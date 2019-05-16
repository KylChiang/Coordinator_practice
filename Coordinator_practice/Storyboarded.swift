//
//  Storyboarded.swift
//  Coordinator_practice
//
//  Created by Kyl Chiang on 2019/5/16.
//  Copyright © 2019 Play4Act Studio. All rights reserved.
//

import UIKit

// let us easy to create view controllers from a storyboard.
protocol Storyboarded {
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate() -> Self {
        // Self: refers to the type that conform to the protocol. e.g. String or Int.
        // self: refers to the value inside that type, e.g. "hello" or 556
        
        // this pulls out "MyApp.MyViewController"
        let fullName = NSStringFromClass(self)
        
        // this splits by the dot and uses everything after, giving "MyViewController"
        let className = fullName.components(separatedBy: ".")[1]
        
        // load out storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        // instantiate a view controller with that identifier, and force cast as the type that was requested.
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
}
