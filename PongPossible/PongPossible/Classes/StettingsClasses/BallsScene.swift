//
//  BallsScene.swift
//  PongPossible
//
//  Created by Marko Vukicevic on 11/5/18.
//  Copyright © 2018 Markan. All rights reserved.
//



import SpriteKit

class BallsScene : SKScene {
    
    var bB = SKSpriteNode()
    var blB = SKSpriteNode()
    var rB = SKSpriteNode()
    var btnBack = SKSpriteNode()

    var lblBeach = SKLabelNode()
    var lblBlue = SKLabelNode()
    var lblRed = SKLabelNode()
    
    override func didMove(to view: SKView) {
        initScene()
    }
    
    func initScene(){
        
        bB = childNode(withName: "bB") as! SKSpriteNode
        blB = childNode(withName: "blB") as! SKSpriteNode
        rB = childNode(withName: "rB") as! SKSpriteNode
        
        lblBeach = childNode(withName: "beachBall") as! SKLabelNode
        lblBlue = childNode(withName: "blueBall") as! SKLabelNode
        lblRed = childNode(withName: "redBall") as! SKLabelNode
        
        btnBack = childNode(withName: "backButton") as! SKSpriteNode
        
        btnBack.position.x = (self.frame.size.width/2) - 40
        btnBack.position.y = (-self.frame.size.height/2) + 50
        
        let texture = SKTexture(imageNamed: "backArrow")
        let action = SKAction.setTexture(texture)
        btnBack.run(action)
        
        let textureB = SKTexture(imageNamed: "blueball")
        let actionB = SKAction.setTexture(textureB)
        blB.run(actionB)
        
        let textureR = SKTexture(imageNamed: "redball")
        let actionR = SKAction.setTexture(textureR)
        rB.run(actionR)
        
        let textureBb = SKTexture(imageNamed: "beachball")
        let actionBb = SKAction.setTexture(textureBb)
        bB.run(actionBb)
        
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        let labels = [lblBeach, lblBlue, lblRed]
        
        for touch in touches {
            let location = touch.location(in: self)
            
            if atPoint(location).name == "backButton" {
                if let scene = StettingsScene(fileNamed: "StettingsScene") {
                    // Set the scale mode to scale to fit the window
                    scene.scaleMode = .aspectFill
                    scene.size = view!.bounds.size
                    // Present the scene
                    view!.presentScene(scene, transition : SKTransition.doorsOpenVertical(withDuration: TimeInterval(1)))
                }
            }
            
            if atPoint(location).name == "beachBall" {
                UserDefaults.standard.set("beach", forKey: "ballType")
                lblBeach.text = "Selected"
                
                for label in labels {
                    if label.name != "beachBall" {
                        label.text = "Select"
                    }
                }
            }
            if atPoint(location).name == "blueBall" {
                UserDefaults.standard.set("blue", forKey: "ballType")
                lblBlue.text = "Selected"
                
                for label in labels {
                    if label.name != "blueBall" {
                        label.text = "Select"
                    }
                }
            }
            if atPoint(location).name == "redBall" {
                UserDefaults.standard.set("red", forKey: "ballType")
                lblRed.text = "Selected"
                
                for label in labels {
                    if label.name != "redBall" {
                        label.text = "Select"
                    }
                }
            }
            
            
            
        }
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
}


















































