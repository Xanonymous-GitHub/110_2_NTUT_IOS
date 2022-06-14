//
//  ViewController.swift
//  My3d
//
//  Created by TeU on 2022/6/15.
//

import ARKit
import SceneKit
import UIKit

class ViewController: UIViewController, ARSCNViewDelegate {
    @IBOutlet var sceneView: ARSCNView!

    var crocodileNode: SCNNode?
    var catNode: SCNNode?

    let arReferenceImageName1 = "qr1"
    let arReferenceImageName2 = "qr2"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the view's delegate
        sceneView.delegate = self

        sceneView.autoenablesDefaultLighting = true

        let crocodileScene = SCNScene(named: "art.scnassets/crocodile.scn")
        crocodileNode = crocodileScene?.rootNode

        let catScene = SCNScene(named: "art.scnassets/cat.scn")
        catNode = catScene?.rootNode
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Create a session configuration
        let configuration = ARImageTrackingConfiguration()

        if let trankingImages = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: .main) {
            configuration.trackingImages = trankingImages
            configuration.maximumNumberOfTrackedImages = 1
        }

        // Run the view's session
        sceneView.session.run(configuration)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        // Pause the view's session
        sceneView.session.pause()
    }

    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()

        if let imageAnchor = anchor as? ARImageAnchor {
            let size = imageAnchor.referenceImage.physicalSize
            let plane = SCNPlane(width: size.width, height: size.height)
            plane.firstMaterial?.diffuse.contents = UIColor.white.withAlphaComponent(0.5)
            let planeNode = SCNNode(geometry: plane)
            planeNode.eulerAngles.x = -.pi / 2
            node.addChildNode(planeNode)

            var shapeNode: SCNNode?
            if imageAnchor.referenceImage.name == arReferenceImageName1 {
                shapeNode = crocodileNode
            }
            if imageAnchor.referenceImage.name == arReferenceImageName2 {
                shapeNode = catNode
            }

            guard let shape = shapeNode else {
                return nil
            }

            node.addChildNode(shape)
        }

        return node
    }
}
