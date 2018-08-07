//
//  ViewController.swift
//  EddieWithBeer
//
//  Created by Sofia on 6/7/18.
//  Copyright © 2018 spine3d. All rights reserved.
//

import UIKit
import SceneKit
import ARKit
import Foundation
import AVKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    //create video player
      /*  let videoPlayer : AVPlayer = {
        
        //let imageName = String()
        
        guard let url = Bundle.main.url(forResource: "NCL", withExtension: "mp4", subdirectory: "art.scnassets") else { print ("could not find video file")
            return AVPlayer()
        }
        
        return AVPlayer(url: url)
    }()
 
     */
    
   // var playerController = AVPlayerViewController()
    var videoPlayer:AVPlayer?
 
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Set the scene to the view
        sceneView.scene = SCNScene()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration and run
        let configuration = ARImageTrackingConfiguration()
        
        guard let trackingImages = ARReferenceImage.referenceImages(inGroupNamed: "Photos", bundle: Bundle.main) else {print("Could not load images")
            return
        }
        
        configuration.trackingImages = trackingImages
        configuration.maximumNumberOfTrackedImages = 3
        
        
        //default lighting
        self.sceneView.autoenablesDefaultLighting = true
        
        sceneView.session.run(configuration)
        
       
    }
    

   
    // Override to create and configure nodes for anchors added to the view's session.
    public func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        //show video overlayed on image
        if let imageAnchor = anchor as? ARImageAnchor {
            
            let referenceImage = imageAnchor.referenceImage
            
            //get image name
            let imageName = referenceImage.name ?? ""
            
            //create plane
            let plane = SCNPlane(width: imageAnchor.referenceImage.physicalSize.width,
                                 height: imageAnchor.referenceImage.physicalSize.height)
            
            //update video url
        /*
            if "NCL" == "NCL" {
                plane.firstMaterial?.diffuse.contents = self.videoPlayer2
                
            }
            else if "EddieWithBeer" == "EddieWithBeer" {
                plane.firstMaterial?.diffuse.contents = self.videoPlayer
                
            }
    */
            if "EddieBeerPic" == imageName {
                
                let videoString:String? = Bundle.main.path(forResource: "EddieBeerVideo", ofType: ".mp4", inDirectory: "art.scnassets")
                if let url = videoString {
                    let videoURL = NSURL(fileURLWithPath: url)
                    
                    self.videoPlayer = AVPlayer(url: videoURL as URL)
                }
            }
            
            if "NCLShip" == imageName {
                
                let videoString:String? = Bundle.main.path(forResource: "NCLShip", ofType: ".mp4", inDirectory: "art.scnassets")
                if let url = videoString {
                    let videoURL = NSURL(fileURLWithPath: url)
                    
                    self.videoPlayer = AVPlayer(url: videoURL as URL)
        
                    
                }
                
            }
            /*
            if "ShipCover" == imageName {
                
                let videoString:String? = Bundle.main.path(forResource: "NCLShip", ofType: ".mp4", inDirectory: "art.scnassets")
                if let url = videoString {
                    let videoURL = NSURL(fileURLWithPath: url)
                    
                    self.videoPlayer = AVPlayer(url: videoURL as URL)
                    
                }
                
            }
             */
            
            
            plane.firstMaterial?.diffuse.contents = self.videoPlayer
            
            //Set AVPlayer as the plane's texture and play
            //plane.firstMaterial?.diffuse.contents = self.videoPlayer
            self.videoPlayer?.play()
            
            let planeNode = SCNNode(geometry: plane)
 
            
            //Rotate plane to match anchor
            planeNode.eulerAngles.x = -.pi / 2
            
            //Add plane node to parent
            node.addChildNode(planeNode)
            
        
            
            if "AtlantisCropped" == imageName {
               /*
                let nodeBox = SCNNode()
                
                nodeBox.geometry = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0)
                nodeBox.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
                nodeBox.position = SCNVector3(0, 0, 0.1)
                plane.firstMaterial?.diffuse.contents = UIColor.clear
                nodeBox.geometry?.firstMaterial?.specular.contents = UIColor.white
                
                
                planeNode.addChildNode(nodeBox)
                */
                
               // let sceneBoat = SCNScene(named: "art.scnassets/WoodBoat.scn") //or WoodBoat.scn
                //planeNode.addChildNode(sceneBoat)
                
                let sceneBoat = SCNScene(named: "art.scnassets/Atlantis.scn")!
                let nodeBoat = sceneBoat.rootNode.childNode(withName: "UnrealEdObject", recursively: true)!
                nodeBoat.scale = SCNVector3(0.002,0.002,0.002)
                nodeBoat.position = SCNVector3(0,0,0)
                //nodeBoat.rotation = SCNVector4( 0, 1, 0, 0)
                //nodeBoat.rotation = SCNVector4( 0, 1, 1, 3.14)
                //nodeBoat.transform = SCNMatrix4MakeRotation(0, 0, 0, 0)
                //nodeBoat.rotation = SCNVector4( 0, 1, 0, 1.57)
                //nodeBoat.castsShadow = false
                nodeBoat.geometry?.firstMaterial?.specular.contents = UIColor.white
                plane.firstMaterial?.diffuse.contents = UIColor.clear
                
                planeNode.addChildNode(nodeBoat)
                
                }
            
            if "AtlantisOcean" == imageName {
                /*
                 let nodeBox = SCNNode()
                 
                 nodeBox.geometry = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0)
                 nodeBox.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
                 nodeBox.position = SCNVector3(0, 0, 0.1)
                 plane.firstMaterial?.diffuse.contents = UIColor.clear
                 nodeBox.geometry?.firstMaterial?.specular.contents = UIColor.white
                 
                 
                 planeNode.addChildNode(nodeBox)
                 */
                
                // let sceneBoat = SCNScene(named: "art.scnassets/WoodBoat.scn") //or WoodBoat.scn
                //planeNode.addChildNode(sceneBoat)
                
                let sceneBoat = SCNScene(named: "art.scnassets/OceanScene.scn")!
                let nodeBoat = sceneBoat.rootNode.childNode(withName: "Body", recursively: true)!
                nodeBoat.scale = SCNVector3(0.01,0.01,0.01)
                nodeBoat.position = SCNVector3(0,0,-0.04)
                //nodeBoat.rotation = SCNVector4( 0, 1, 0, 0)
                //nodeBoat.rotation = SCNVector4( 0, 1, 1, 3.14)
                //nodeBoat.transform = SCNMatrix4MakeRotation(0, 0, 0, 0)
                //nodeBoat.rotation = SCNVector4( 0, 1, 0, 1.57)
                //nodeBoat.castsShadow = false
                nodeBoat.geometry?.firstMaterial?.specular.contents = UIColor.white
                plane.firstMaterial?.diffuse.contents = UIImage(named: "OceanImage")
                //let action = SCNAction.moveBy(x: 0, y: 0, z: 0, duration: 3)
                let action = SCNAction.move(to: SCNVector3(0,0,0), duration: 3)
                nodeBoat.runAction(action)
                
                planeNode.addChildNode(nodeBoat)
                
            }

            
            
        }
        
        return node
    }

    
    
}

