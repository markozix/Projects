//
//  LevelsClass.swift
//  PongPossible
//
//  Created by Marko Vukicevic on 2/8/19.
//  Copyright © 2019 Markan. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

class LevelsClass : SKScene {
    
    private var lblEasy = SKLabelNode()
    private var lblMedium = SKLabelNode()
    private var lblHard = SKLabelNode()
    private var lblImpossible = SKLabelNode()
    
    private var easy = SKShapeNode()
    private var medium = SKShapeNode()
    private var hard = SKShapeNode()
    private var impossible = SKShapeNode()
    
    var btnBack = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        
        initScene()
        
    }
    
    
    func initScene(){
        
        lblEasy = childNode(withName: "lblEasy") as! SKLabelNode
        lblMedium = childNode(withName: "lblMedium") as! SKLabelNode
        lblHard = childNode(withName: "lblHard") as! SKLabelNode
        lblImpossible = childNode(withName: "lblImpossible") as! SKLabelNode
        
        easy = childNode(withName: "easy") as! SKShapeNode
        medium = childNode(withName: "medium") as! SKShapeNode
        hard = childNode(withName: "hard") as! SKShapeNode
        impossible = childNode(withName: "impossible") as! SKShapeNode
        
        btnBack = childNode(withName: "backButton") as! SKSpriteNode
        
        btnBack.position.x = (self.frame.size.width/2) - 40
        btnBack.position.y = (-self.frame.size.height/2) + 50
        
        let texture = SKTexture(imageNamed: "backArrow")
        let action = SKAction.setTexture(texture)
        btnBack.run(action)
        
        napraviShape()
        
    }
    
    func napraviShape() {
        
        easy.path = UIBezierPath(roundedRect: CGRect(x: -200, y: -100, width: 400.0, height: 70.0), cornerRadius: 75.0).cgPath
        easy.fillColor = UIColor.black
        lblEasy.position = CGPoint(x: 0, y: 144)
        
        medium.path = UIBezierPath(roundedRect: CGRect(x: -200, y: -120, width: 400.0, height: 70.0), cornerRadius: 75.0).cgPath
        medium.fillColor = UIColor.black
        lblMedium.position = CGPoint(x: 0, y: 27.86)
        
        hard.path = UIBezierPath(roundedRect: CGRect(x: -200, y: -140, width: 400.0, height: 70.0), cornerRadius: 75.0).cgPath
        hard.fillColor = UIColor.black
        lblHard.position = CGPoint(x: 0, y: -87)
        
        impossible.path = UIBezierPath(roundedRect: CGRect(x: -200, y: -160, width: 400.0, height: 70.0), cornerRadius: 75.0).cgPath
        impossible.fillColor = UIColor.black
        lblImpossible.position = CGPoint(x: 0, y: -207)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches{
            
            let location = touch.location(in: self)
            
            if atPoint(location).name == "backButton" {
                
                if let scene = MMClass(fileNamed: "MMScene") {
                    // Set the scale mode to scale to fit the window
                    scene.scaleMode = .aspectFill
                    scene.size = view!.bounds.size
                    // Present the scene
                    view!.presentScene(scene, transition : SKTransition.doorsOpenVertical(withDuration: TimeInterval(0.75)))
                }
            }
            
            if atPoint(location).name == "lblEasy" || atPoint(location).name == "easy" {
                UserDefaults.standard.set("Easy", forKey: "mode")
                easy.fillColor = UIColor.white.withAlphaComponent(0.15)
                if let scene = GameScene(fileNamed: "GameScene") {
                    // Set the scale mode to scale to fit the window
                    scene.scaleMode = .aspectFill
                    scene.size = view!.bounds.size
                    // Present the scene
                    view!.presentScene(scene, transition : SKTransition.doorsOpenVertical(withDuration: TimeInterval(0.75)))
                }
            }
            
            if atPoint(location).name == "lblMedium" || atPoint(location).name == "medium"{
                UserDefaults.standard.set("Medium", forKey: "mode")
                medium.fillColor = UIColor.white.withAlphaComponent(0.15)
                if let scene = GameScene(fileNamed: "GameScene") {
                    // Set the scale mode to scale to fit the window
                    scene.scaleMode = .aspectFill
                    scene.size = view!.bounds.size
                    // Present the scene
                    view!.presentScene(scene, transition : SKTransition.doorsOpenVertical(withDuration: TimeInterval(0.75)))
                }
            }
            
            if atPoint(location).name == "lblHard" || atPoint(location).name == "hard" {
                UserDefaults.standard.set("Hard", forKey: "mode")
                hard.fillColor = UIColor.white.withAlphaComponent(0.15)
                if let scene = GameScene(fileNamed: "GameScene") {
                    // Set the scale mode to scale to fit the window
                    scene.scaleMode = .aspectFill
                    scene.size = view!.bounds.size
                    // Present the scene
                    view!.presentScene(scene, transition : SKTransition.doorsOpenVertical(withDuration: TimeInterval(0.75)))
                }
            }
            
            if atPoint(location).name == "lblImpossible" || atPoint(location).name == "impossible" {
                UserDefaults.standard.set("Impossible", forKey: "mode")
                impossible.fillColor = UIColor.white.withAlphaComponent(0.15)
                if let scene = GameScene(fileNamed: "GameScene") {
                    // Set the scale mode to scale to fit the window
                    scene.scaleMode = .aspectFill
                    scene.size = view!.bounds.size
                    // Present the scene
                    view!.presentScene(scene, transition : SKTransition.doorsOpenVertical(withDuration: TimeInterval(0.75)))
                }
            }
        }
    }
    
    
    
}
