//
//  ViewController.swift
//  ARDicee
//
//  Created by Plamen Kostadinov on 28.12.18.
//  Copyright © 2018 Plamen Kostadinov. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create some geometry - e.g. Cube
        let cube = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.01)
        
        // Create material for the cube
        let material = SCNMaterial()
        material.diffuse.contents = UIColor.yellow
        
        // Assign this material to materials array. In the example the array contains only one object
        cube.materials = [material]
        
        // Create node - this is a point in 3D space
        let node = SCNNode()
        // Give position to the node. If z is negative it is away from us!
        node.position = SCNVector3(x:0, y:0.1, z:-0.5)
        // Assign to that node what object to display - created cude
        node.geometry = cube
        
        // Put the node to a Scene view. It is added as a child node to a root node - there could be added more child nodes
        // In example with the ship (plain) - ship is root, shipMesh is a childNode. And shipMech has also childNode - emiter
        sceneView.scene.rootNode.addChildNode(node)
        
        // Enable some light
        sceneView.autoenablesDefaultLighting = true
        
//        // Create a new scene
//        let scene = SCNScene(named: "art.scnassets/ship.scn")!
//
//        // Set the scene to the view
//        sceneView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
