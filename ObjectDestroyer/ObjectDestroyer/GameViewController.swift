//
//  GameViewController.swift
//  ObjectDestroyer
//
//  Created by Marko Vukicevic on 9/27/18.
//  Copyright © 2018 Markan. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit


class GameViewController: UIViewController, SCNSceneRendererDelegate {

    var gameView : SCNView!
    var gameScene : SCNScene!
    var cameraNode : SCNNode!
    var targetCreationTime : TimeInterval = 0
    var score: SCNFloat = 0.0 //skor se azurira treba srediti prikaz i kraj kad dodje na < 0
    var scoreLabel : UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        initView()
        initScene()
        initCamera()
    }
    
    
    func initView(){
        
        gameView = self.view as! SCNView
        //fiksiramo kameru na view koji smo mi podesili
        gameView.allowsCameraControl = false
        gameView.autoenablesDefaultLighting = true
        gameView.delegate = self
        
//        scoreLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.gameView.frame.width, height: 100))
//        scoreLabel.textAlignment = .center
//        scoreLabel.center = CGPoint(x: self.gameView.frame.width / 2, y: self.gameView.frame.height / 2 - self.view.frame.height)
//        scoreLabel.textColor = UIColor.gray
//        gameView.addSubview(scoreLabel)
//
//        scoreLabel.alpha = 0
        
        
        
    }
    
    func initScene(){
        gameScene = SCNScene()
        gameView.scene = gameScene
        gameView.isPlaying = true
        
    }
    
    func initCamera(){
        cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        
        cameraNode.position = SCNVector3(x: 0, y: 5, z: 10)
        
        gameScene.rootNode.addChildNode(cameraNode)
    }
    
    func createTarget(){
        let geometry: SCNGeometry = SCNBox(width: 0.7, height: 0.7, length: 0.7, chamferRadius: 0)
        
        let randomColor = arc4random_uniform(2) == 0 ? UIColor.green : UIColor.red
        
        
        geometry.materials.first?.diffuse.contents = randomColor
        
        let geometryNode = SCNNode(geometry: geometry)
        geometryNode.physicsBody = SCNPhysicsBody(type: .dynamic, shape: nil)
        
        
        if randomColor == UIColor.red {
            geometryNode.name = "enemy"
        }else{
            geometryNode.name = "friend"
        }
        
        
        gameScene.rootNode.addChildNode(geometryNode)
        
        let randomDirection: Float = arc4random_uniform(2) == 0 ? -1.0 : 1.0
        
        
        let force = SCNVector3(x: randomDirection, y: 15, z: 0)
        
        geometryNode.physicsBody?.applyForce(force, at: SCNVector3(x: 0.05, y: 0.05, z: 0.05), asImpulse: true)
        
    }
    
  
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let location = touch.location(in: gameView)
        let hitList = gameView.hitTest(location, options: nil)
        
        
        
        if let hitObject = hitList.first{
            let node = hitObject.node
            
            if node.name == "friend"{
                score += 1.0
                scoreLabel.text = "\(score)"
                print(score)
                node.removeFromParentNode()
                self.gameView.backgroundColor = UIColor.black
               
            }else{
                
                score -= 2.0
                if(score > 0){
                    scoreLabel.text = "\(score)"
                }else{
                    print("kraj igre")
                }
                print(score)
                node.removeFromParentNode()
                self.gameView.backgroundColor = UIColor.red
              
                
               
              
                
             
            }
        }
        
    }
    
    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        if time > targetCreationTime {
            createTarget()
            targetCreationTime = time + 0.65
        }
        cleanUp()
    }
    
    func cleanUp(){
        for node in gameScene.rootNode.childNodes{
            if node.position.y < -2 {
                node.removeFromParentNode()
            }
        }
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

}
