//
//  ViewController.swift
//  ARTest
//
//  Created by Jeremy Seibert on 7/1/17.
//  Copyright © 2017 Jeremy Seibert. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController {

    
    @IBOutlet weak var sceneView: ARSCNView!
    @IBOutlet weak var counterLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scene = SCNScene()
        
        sceneView.scene = scene
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Wire up the ARSession
        let configuration = ARSessionConfiguration()
        sceneView.session.run(configuration)
        addObject()
        
    }
    
    // Setup & Load the Spaceship Object
    func addObject() {
        let ship = SpaceShip()
        ship.loadModel()
        
        //Establish the Random Postion
        let xPos = randomPosition(lowerBound: -1.5, upperBound: 1.5)
        let yPos = randomPosition(lowerBound: -1.5, upperBound: 1.5)
        ship.position = SCNVector3(xPos,yPos, -1)
        
        sceneView.scene.rootNode.addChildNode(ship)
    }
    
    
    func randomPosition(lowerBound lower: Float, upperBound upper: Float) -> Float {
        return Float(arc4random()) / Float(UInt32.max) * (lower - upper) + upper
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

