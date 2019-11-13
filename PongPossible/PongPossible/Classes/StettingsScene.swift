//
//  StettingsScene.swift
//  PongPossible
//
//  Created by Marko Vukicevic on 10/18/18.
//  Copyright © 2018 Markan. All rights reserved.
//

import SpriteKit
import UIKit

class StettingsScene : SKScene {
    
    var lblNaslov = SKLabelNode()
    var lblBacgrounds = SKLabelNode()
    var lblPaddles = SKLabelNode()
    var lblBalls = SKLabelNode()
    var btnBack = SKSpriteNode()
    var lblModes = SKLabelNode()
    
    var bgShape = SKShapeNode()
    var paddlesShape = SKShapeNode()
    var ballsShape = SKShapeNode()
    var modeShape = SKShapeNode()
    
    override func didMove(to view: SKView) {
        
        initScene()
        
    }
    
    
    func initScene(){
        
        lblNaslov = childNode(withName: "Stettings menu") as! SKLabelNode
        lblBacgrounds = childNode(withName: "Backgrounds") as! SKLabelNode
        lblPaddles = childNode(withName: "Paddles") as! SKLabelNode
        lblBalls = childNode(withName: "Balls") as! SKLabelNode
        lblModes = childNode(withName: "Modes") as! SKLabelNode
        
        bgShape = childNode(withName: "bgShape") as! SKShapeNode
        paddlesShape = childNode(withName: "paddlesShape") as! SKShapeNode
        ballsShape = childNode(withName: "ballsShape") as! SKShapeNode
        modeShape = childNode(withName: "modeShape") as! SKShapeNode
 
        
        btnBack = childNode(withName: "backButton") as! SKSpriteNode
        
        btnBack.position.x = (self.frame.size.width/2) - 40
        btnBack.position.y = (-self.frame.size.height/2) + 50
        
        let texture = SKTexture(imageNamed: "backArrow")
        let action = SKAction.setTexture(texture)
        btnBack.run(action)
        
        napraviShape()
        
    }
    
    func napraviShape(){
        
        bgShape.path = UIBezierPath(roundedRect: CGRect(x: -200, y: -20, width: 400.0, height: 70.0), cornerRadius: 75.0).cgPath
        bgShape.fillColor = UIColor.black
        lblBacgrounds.position = CGPoint(x: 0, y: 93)
        
        ballsShape.path = UIBezierPath(roundedRect: CGRect(x: -200, y: -40, width: 400.0, height: 70.0), cornerRadius: 75.0).cgPath
        ballsShape.fillColor = UIColor.black
        lblBalls.position = CGPoint(x: 0, y: 0)
        
        paddlesShape.path = UIBezierPath(roundedRect: CGRect(x: -200, y: -60, width: 400.0, height: 70.0), cornerRadius: 75.0).cgPath
        paddlesShape.fillColor = UIColor.black
        lblPaddles.position = CGPoint(x: 0, y: -91)
        
        modeShape.path = UIBezierPath(roundedRect: CGRect(x: -200, y: -80, width: 400.0, height: 70.0), cornerRadius: 75.0).cgPath
        modeShape.fillColor = UIColor.black
        lblModes.position = CGPoint(x: 0, y: -181)
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            
            let location = touch.location(in: self)
            
            if atPoint(location).name == "Backgrounds" || atPoint(location).name == "bgShape" {
                bgShape.fillColor = UIColor.white.withAlphaComponent(0.15)
                if let scene = BackgroundsScene(fileNamed: "BackgroundsScene") {
                    // Set the scale mode to scale to fit the window
                    scene.scaleMode = .aspectFill
                    scene.size = view!.bounds.size
                    // Present the scene
                    view!.presentScene(scene, transition : SKTransition.doorsOpenVertical(withDuration: TimeInterval(1)))
                }
            }
            
            if atPoint(location).name == "Paddles" || atPoint(location).name == "paddlesShape" {
                paddlesShape.fillColor = UIColor.white.withAlphaComponent(0.15)
                if let scene = PaddlesScene(fileNamed: "PaddlesScene") {
                    // Set the scale mode to scale to fit the window
                    scene.scaleMode = .aspectFill
                    scene.size = view!.bounds.size
                    // Present the scene
                    view!.presentScene(scene, transition : SKTransition.doorsOpenVertical(withDuration: TimeInterval(1)))
                }
            }
            
            if atPoint(location).name == "Balls" || atPoint(location).name == "ballsShape" {
                ballsShape.fillColor = UIColor.white.withAlphaComponent(0.15)
                if let scene = BallsScene(fileNamed: "BallsScene") {
                    // Set the scale mode to scale to fit the window
                    scene.scaleMode = .aspectFill
                    scene.size = view!.bounds.size
                    // Present the scene
                    view!.presentScene(scene, transition : SKTransition.doorsOpenVertical(withDuration: TimeInterval(1)))
                }
            }
            
            if atPoint(location).name == "backButton"{
                if let scene = MMClass(fileNamed: "MMScene") {
                    // Set the scale mode to scale to fit the window
                    scene.scaleMode = .aspectFill
                    scene.size = view!.bounds.size
                    // Present the scene
                    view!.presentScene(scene, transition : SKTransition.doorsOpenVertical(withDuration: TimeInterval(1)))
                }
            }
            
            if atPoint(location).name == "Modes" || atPoint(location).name == "modeShape" {
                modeShape.fillColor = UIColor.white.withAlphaComponent(0.15)
                if let scene = ModesScene(fileNamed: "ModesScene") {
                    // Set the scale mode to scale to fit the window
                    scene.scaleMode = .aspectFill
                    scene.size = view!.bounds.size
                    // Present the scene
                    view!.presentScene(scene, transition : SKTransition.doorsOpenVertical(withDuration: TimeInterval(1)))
                }
            }
      
        }
        
    }
  
    
    
}






























