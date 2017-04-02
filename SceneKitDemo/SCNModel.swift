//
//  SCNModel.swift
//  SceneKitDemo
//
//  Created by Michael Edenzon on 11/27/16.
//  Copyright © 2016 Michael Edenzon. All rights reserved.
//

import UIKit
import SceneKit

class SCNModel {
    
    private var _path: String!
    private var _url: URL!
    private var _title: String!
    
    var path: String! {
        get {
            return self._path
        }
    }
    
    var title: String! {
        get {
            return self._title
        }
    }
    
    init() {
        self._path = ""
        self._title = ""
    }
    
    convenience init(path: String) {
        self.init()
        self._path = path
        self._title = ""
    }
    
    convenience init(path: String, title: String) {
        self.init(path: path)
        self._title = title
    }
}


















































