//
//  SCNModelView.swift
//  SceneKitDemo
//
//  Created by Michael Edenzon on 11/25/16.
//  Copyright © 2016 Michael Edenzon. All rights reserved.
//

import UIKit
import SceneKit

class SCNModelView: UIView {

    private var sceneView: SCNView!
    private var scene: SCNScene!
    private var cameraNode: SCNNode!
    private var backdrop: CAShapeLayer!
    
    private var model: SCNModel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupScene()
        setupCamera()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        sceneView = SCNView(frame: self.frame)
        sceneView.isUserInteractionEnabled = true
        sceneView.showsStatistics = false
        sceneView.allowsCameraControl = true
        sceneView.autoenablesDefaultLighting = true
        sceneView.antialiasingMode = .multisampling4X
        self.addSubview(sceneView)
    }
    
    private func setupBackdrop() {
        backdrop.path = UIBezierPath(ovalIn: self.frame).cgPath
        let colors = [UIColor.black.cgColor, UIColor.gray.cgColor] as CFArray
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let gradient = CGGradient(colorsSpace: colorSpace, colors: colors , locations: nil)
        backdrop.fillColor = gradient as! CGColor?
    }
    
    private func setupScene() {
        scene = SCNScene()
        sceneView.scene = scene
    }

    private func setupCamera() {
        cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 8)
        scene.rootNode.addChildNode(cameraNode)
    }
 
    private func colladaToNode(path: String) -> SCNNode {
        let node = SCNNode()
        let scene = SCNScene(named: path)
        let nodeArray = scene!.rootNode.childNodes
        for childNode in nodeArray {
            node.addChildNode(childNode as SCNNode)
        }
        return node
    }
    
    private func recoverColladaNodeArray(path: String) -> [SCNNode] {
        return SCNScene(named: path)!.rootNode.childNodes
    }

    func addModel(model: SCNModel) {
        self.model = model
        let node = colladaToNode(path: model.path)
        node.scale = SCNVector3(0.5,0.5,0.5)
        node.rotation = SCNVector4(0, 0, 0, 0)
        scene.rootNode.addChildNode(node)
    }
}




































