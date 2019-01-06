//
//  ViewController.swift
//  Sollar system
//
//  Created by Plamen Kostadinov on 29.12.18.
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
        
        // Create Sun
        let sun = createHeavenlyBody(radius: 1.8, texture: "art.scnassets/8k_sun.jpg")
        let mercury = createHeavenlyBody(radius: 0.1, texture: "art.scnassets/8k_mercury.jpg")
        let venus = createHeavenlyBody(radius: 0.15, texture: "art.scnassets/8k_venus_surface.jpg")
        let earth = createHeavenlyBody(radius: 0.2, texture: "art.scnassets/8k_earth_daymap.jpg")
        let mars = createHeavenlyBody(radius: 0.13, texture: "art.scnassets/8k_mars.jpg")
        let jupiter = createHeavenlyBody(radius: 0.4, texture: "art.scnassets/8k_jupiter.jpg")
        let saturn = createHeavenlyBody(radius: 0.3, texture: "art.scnassets/8k_saturn.jpg")
        let uranus = createHeavenlyBody(radius: 0.25, texture: "art.scnassets/2k_uranus.jpg")
        let neptun = createHeavenlyBody(radius: 0.25, texture: "art.scnassets/2k_neptune.jpg")
        
        addObjectToScene(sceneView: sceneView, coordinates: Position(x: 0.0, y: 0.1, z: -8.0), heavenlyBody: sun)
        addObjectToScene(sceneView: sceneView, coordinates: Position(x: -2.2, y: 0.5, z: -7.1), heavenlyBody: mercury)
        addObjectToScene(sceneView: sceneView, coordinates: Position(x: 2.2, y: 0.3, z: -6.8), heavenlyBody: venus)
        addObjectToScene(sceneView: sceneView, coordinates: Position(x: 1.0, y: -1.1, z: -5.5), heavenlyBody: earth)
        addObjectToScene(sceneView: sceneView, coordinates: Position(x: -1.75, y: 0.4, z: -6.2), heavenlyBody: mars)
        addObjectToScene(sceneView: sceneView, coordinates: Position(x: 1.5, y: 0.8, z: -4.6), heavenlyBody: jupiter)
        addObjectToScene(sceneView: sceneView, coordinates: Position(x: -2.5, y: -0.3, z: -9.1), heavenlyBody: saturn)
        addObjectToScene(sceneView: sceneView, coordinates: Position(x: -3.5, y: -0.1, z: -10.5), heavenlyBody: uranus)
        addObjectToScene(sceneView: sceneView, coordinates: Position(x: 5.0, y: -0.6, z: -11.2), heavenlyBody: neptun)
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
    
    func createHeavenlyBody(radius: CGFloat, texture: String) -> SCNSphere {
        let sphere = SCNSphere(radius: radius)
        let material = SCNMaterial()
        material.diffuse.contents = UIImage(named: texture)
        sphere.materials = [material]
        
        return sphere
    }
    
    func addObjectToScene(sceneView: ARSCNView, coordinates: Position, heavenlyBody: SCNSphere) {
        let node = SCNNode()
        node.position = SCNVector3(x: coordinates.X, y: coordinates.Y, z: coordinates.Z)
        node.geometry = heavenlyBody
        sceneView.scene.rootNode.addChildNode(node)
        sceneView.autoenablesDefaultLighting = true
    }
}
