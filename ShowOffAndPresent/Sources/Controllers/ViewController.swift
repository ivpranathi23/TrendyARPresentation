//
//  ViewController.swift
//  ARProjectsRoadMap7thAug
//
//  Created by RNTBCI-Mcc on 07/08/18.
//  Copyright © 2018 RNTBCI. All rights reserved.
//

import UIKit
import SceneKit
import ARKit
import  AVFoundation

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    var images: [UIImage] = [UIImage]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Presentation"
        sceneView.delegate = self
        sceneView.showsStatistics = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)
        
        self.proceedWithCameraAccessCheck()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sceneView.session.pause()
    }
    
    func proceedWithCameraAccessCheck(){
        // handler in .requestAccess is needed to process user's answer to our request
        AVCaptureDevice.requestAccess(for: .video) { success in
            if success { // if request is granted (success is true)
                 self.addRoadMap()
            } else { // if request is denied (success is false)
                // Create Alert
                let alert = UIAlertController(title: "Camera", message: "Camera access is absolutely necessary to use this app. Please enable it in Settings.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                    UIApplication.shared.open(URL(string: UIApplicationOpenSettingsURLString)!)
                }))
                self.present(alert, animated: true)
            }
        }
    }

    
    func addRoadMap() {
        guard let carScene = SCNScene(named: "art.scnassets/Billboard_dae/Billboard.dae") else {
            return
        }
        let carNode = SCNNode()
        let carSceneChildNodes = carScene.rootNode.childNodes
        var verychildNodes:[SCNNode] = [SCNNode]()
        for childNode in carSceneChildNodes {
            verychildNodes = childNode.childNodes
            carNode.addChildNode(childNode)
        }
        
        for childNode in verychildNodes {
            if childNode.name == "ads" {
                var imageMaterial = SCNMaterial()
                imageMaterial.isDoubleSided = false
                imageMaterial.diffuse.contents = self.images[0]
                childNode.geometry?.materials = [imageMaterial]
            }
        }
        
        carNode.position = SCNVector3(5, -10, -10)
        carNode.scale = SCNVector3(0.03, 0.03, 0.03)
        
        var action = SCNAction.rotateBy(x: 0, y: 3, z: 0, duration: 10)
        carNode.runAction(action)
        self.sceneView.scene.rootNode.addChildNode(carNode)
        
        guard let carScene2 = SCNScene(named: "art.scnassets/Billboard_dae2/Billboard.dae") else
        {
            return
            
        }
        let carNode2 = SCNNode()
        let carSceneChildNodes2 = carScene2.rootNode.childNodes
        
        for childNode in carSceneChildNodes2 {
            verychildNodes = childNode.childNodes
            carNode2.addChildNode(childNode)
        }
        
        for childNode in verychildNodes {
            if childNode.name == "ads" {
                var imageMaterial = SCNMaterial()
                imageMaterial.isDoubleSided = false
                imageMaterial.diffuse.contents = self.images[1]
                childNode.geometry?.materials = [imageMaterial]
            }
        }
        
        carNode2.position = SCNVector3(2, -10, -13)
        carNode2.scale = SCNVector3(0.03, 0.04, 0.03)
        
        carNode2.runAction(action)
        self.sceneView.scene.rootNode.addChildNode(carNode2)
        
        
        guard let carScene3 = SCNScene(named: "art.scnassets/Billboard_dae3/Billboard.dae") else
        {
            return
            
        }
        let carNode3 = SCNNode()
        let carSceneChildNodes3 = carScene3.rootNode.childNodes
        
        for childNode in carSceneChildNodes3 {
            verychildNodes = childNode.childNodes
            carNode3.addChildNode(childNode)
        }
        
        for childNode in verychildNodes {
            if childNode.name == "ads" {
                var imageMaterial = SCNMaterial()
                imageMaterial.isDoubleSided = false
                imageMaterial.diffuse.contents = self.images[2]
                childNode.geometry?.materials = [imageMaterial]
            }
        }
        
        carNode3.position = SCNVector3(-1, -10, -16)
        carNode3.scale = SCNVector3(0.03, 0.06, 0.03)
        
        carNode3.runAction(action)
        self.sceneView.scene.rootNode.addChildNode(carNode3)
        
        guard let carScene4 = SCNScene(named: "art.scnassets/Billboard_dae4/Billboard.dae") else
        {
            return
            
        }
        let carNode4 = SCNNode()
        let carSceneChildNodes4 = carScene4.rootNode.childNodes
        
        for childNode in carSceneChildNodes4 {
            verychildNodes = childNode.childNodes
            carNode4.addChildNode(childNode)
        }
        
        for childNode in verychildNodes {
            if childNode.name == "ads" {
                var imageMaterial = SCNMaterial()
                imageMaterial.isDoubleSided = false
                imageMaterial.diffuse.contents = self.images[3]
                childNode.geometry?.materials = [imageMaterial]
            }
        }
        
        carNode4.position = SCNVector3(-4, -10, -19)
        carNode4.scale = SCNVector3(0.05, 0.11, 0.05)
        
        carNode4.runAction(action)
        self.sceneView.scene.rootNode.addChildNode(carNode4)
        
        guard let carScene5 = SCNScene(named: "art.scnassets/Billboard_dae5/Billboard.dae") else
        {
            return
            
        }
        let carNode5 = SCNNode()
        let carSceneChildNodes5 = carScene5.rootNode.childNodes
        
        for childNode in carSceneChildNodes5 {
            carNode5.addChildNode(childNode)
            verychildNodes = childNode.childNodes

        }
        for childNode in verychildNodes {
            if childNode.name == "ads" {
                var imageMaterial = SCNMaterial()
                imageMaterial.isDoubleSided = false
                imageMaterial.diffuse.contents = self.images[4]
                childNode.geometry?.materials = [imageMaterial]
            }
        }
        
        carNode5.position = SCNVector3(-10, -10, -22)
        carNode5.scale = SCNVector3(0.07, 0.25, 0.06)
        action = SCNAction.rotateBy(x: 0, y: 3.2, z: 0, duration: 10)
        carNode5.runAction(action)
        self.sceneView.scene.rootNode.addChildNode(carNode5)
    }
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        var errMsgdisplay = ""
        if error.localizedDescription == "Unsupported configuration." {
            errMsgdisplay = "Your device does not support Augmented Reality. Please download the application to other devices which supports Augmented Reality."
            let alert = UIAlertController(title: "Warning", message: errMsgdisplay
                , preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                self.navigationController?.popViewController(animated: true)
            }))
            self.present(alert, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Camera", message: "Camera access is absolutely necessary to use this app. Please enable it in Settings.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                UIApplication.shared.open(URL(string: UIApplicationOpenSettingsURLString)!)
            }))
            self.present(alert, animated: true)
        }
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
