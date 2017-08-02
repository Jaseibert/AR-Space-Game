//
//  SpaceShip.swift
//  ARTest
//
//  Created by Jeremy Seibert on 6/24/17.
//  Copyright © 2017 Jeremy Seibert. All rights reserved.
//

import UIKit
import ARKit

class SpaceShip: SCNNode {
    
    // Create the SceneKit Model
    func loadModel() {
        guard let virtualObjectScene = SCNScene(named:"art.scnassests/ship.sch") else {return}
        
        // Establish SceneKit Node
        let wrapperNode = SCNNode()
        for child in virtualObjectScene.rootNode.childNodes {
            wrapperNode.addChildNode(child)
        }
        self.addChildNode(wrapperNode)
    }
}
