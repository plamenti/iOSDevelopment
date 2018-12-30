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
        
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]
        
        // Set the view's delegate
        sceneView.delegate = self
        
        //                // Create some geometry - e.g. Cube
        //                //        let cube = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.01)
        //
        //                // Create some geometry - Sphere with radius 20 centimeters
        //                let sphere = SCNSphere(radius: 0.2)
        //
        //                // Create material for the cube
        //                let material = SCNMaterial()
        //                material.diffuse.contents = UIImage(named: "art.scnassets/8k_venus_surface.jpg")
        //
        //                // Assign this material to materials array. In the example the array contains only one object
        //                //        cube.materials = [material]
        //                sphere.materials = [material]
        //
        //                // Create node - this is a point in 3D space
        //                let node = SCNNode()
        //                // Give position to the node. If z is negative it is away from us!
        //                node.position = SCNVector3(x:0, y:0.1, z:-0.5)
        //                // Assign to that node what object to display - created cude
        //                //        node.geometry = cube
        //                // Assign to that node what object to display - created sphere
        //                node.geometry = sphere
        //
        //                // Put the node to a Scene view. It is added as a child node to a root node - there could be added more child nodes
        //                // In example with the ship (plain) - ship is root, shipMesh is a childNode. And shipMech has also childNode - emiter
        //                sceneView.scene.rootNode.addChildNode(node)
        
        // Enable some light
        sceneView.autoenablesDefaultLighting = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        // in roder to use .vertical - configuration.planeDetection = [.horizontal, .vertical]
        configuration.planeDetection = [.horizontal, .vertical]
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let touchLocation = touch.location(in: sceneView)
            
            let results = sceneView.hitTest(touchLocation, types: .existingPlaneUsingExtent)
            
            //            if !results.isEmpty {
            //                print("Touched the plane")
            //            } else {
            //                print("Touched somewhere else")
            //            }
            
            if let hitResult = results.first {
                print(hitResult)
                
                // Create a new scene
                let diceScene = SCNScene(named: "art.scnassets/diceCollada.scn")!
                
                if let diceNode = diceScene.rootNode.childNode(withName: "Dice", recursively: true) {
                    
                    diceNode.position = SCNVector3(
                        x: hitResult.worldTransform.columns.3.x,
                        y: hitResult.worldTransform.columns.3.y + diceNode.boundingSphere.radius,
                        z: hitResult.worldTransform.columns.3.z
                    )
                    
                    sceneView.scene.rootNode.addChildNode(diceNode)
                }
            }
        }
    }
    
    // This is delegate method used to detect horizontal plane
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        if anchor is ARPlaneAnchor {
            print("Plane detected")
            
            let planeAnchor = anchor as! ARPlaneAnchor
            let plane = SCNPlane(width: CGFloat(planeAnchor.extent.x), height: CGFloat(planeAnchor.extent.z))
            
            let planeNode = SCNNode()
            planeNode.position = SCNVector3(x: planeAnchor.center.x, y: 0, z: planeAnchor.center.z)
            planeNode.transform = SCNMatrix4MakeRotation(-Float.pi/2, 1, 0, 0)
            let gridmaterial = SCNMaterial()
            gridmaterial.diffuse.contents = UIImage(named: "art.scnassets/grid.png")
            plane.materials = [gridmaterial]
            planeNode.geometry = plane
            
            node.addChildNode(planeNode)
        } else {
            return
        }
    }
}
