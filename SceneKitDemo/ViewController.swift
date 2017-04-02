//
//  ViewController.swift
//  SceneKitDemo
//
//  Created by Michael Edenzon on 11/25/16.
//  Copyright © 2016 Michael Edenzon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var modelView: SCNModelView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        modelView = SCNModelView(frame: view.frame)
        let model = SCNModel(path: "helix.dae")
        modelView.addModel(model: model)
        view.addSubview(modelView)
    }
    
    override var prefersStatusBarHidden: Bool {
        get {
            return true
        }
    }
    
    override var shouldAutorotate: Bool {
        get {
            return false
        }
    }
}

