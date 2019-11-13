//
//  PaddlesScene.swift
//  PongPossible
//
//  Created by Marko Vukicevic on 10/21/18.
//  Copyright © 2018 Markan. All rights reserved.
//

import SpriteKit


class PaddlesScene : SKScene {
    
    var lblBlue = SKLabelNode()
    var lblRed = SKLabelNode()
    var lblWhite = SKLabelNode()
    var lblYellow = SKLabelNode()
    
    var lblSelectBlue = SKLabelNode()
    var lblSelectRed = SKLabelNode()
    var lblSelectWhite = SKLabelNode()
    var lblSelectYellow = SKLabelNode()
 
    var pbgBlue = SKSpriteNode()
    var pbgRed = SKSpriteNode()
    var pbgWhite = SKSpriteNode()
    var pbgYellow = SKSpriteNode()

    var btnBack = SKSpriteNode()
    

    override func didMove(to view: SKView) {
        initScene()
    }
    
    
    
    func initScene(){
        
        lblRed = childNode(withName: "lblRed") as! SKLabelNode
        lblBlue = childNode(withName: "lblBlue") as! SKLabelNode
        lblWhite = childNode(withName: "lblWhite") as! SKLabelNode
        lblYellow = childNode(withName: "lblYellow") as! SKLabelNode
        
        lblSelectBlue = childNode(withName: "selectBlue") as! SKLabelNode
        lblSelectRed = childNode(withName: "selectRed") as! SKLabelNode
        lblSelectWhite = childNode(withName: "selectWhite") as! SKLabelNode
        lblSelectYellow = childNode(withName: "selectYellow") as! SKLabelNode
        
        pbgRed = childNode(withName: "red") as! SKSpriteNode
        pbgBlue = childNode(withName: "blue") as! SKSpriteNode
        pbgWhite = childNode(withName: "white") as! SKSpriteNode
        pbgYellow = childNode(withName: "yellow") as! SKSpriteNode
        
        btnBack = childNode(withName: "backButton") as! SKSpriteNode
        
        btnBack.position.x = (self.frame.size.width/2) - 40
        btnBack.position.y = (-self.frame.size.height/2) + 50
        
        let texture = SKTexture(imageNamed: "backArrow")
        let action = SKAction.setTexture(texture)
        btnBack.run(action)
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let labels = [lblSelectBlue, lblSelectRed, lblSelectWhite, lblSelectYellow]
        
        for touch in touches {
            let location = touch.location(in: self)
            
            //vraca nazad
            if atPoint(location).name == "backButton" {
                if let scene = StettingsScene(fileNamed: "StettingsScene") {
                    // Set the scale mode to scale to fit the window
                    scene.scaleMode = .aspectFill
                    scene.size = view!.bounds.size
                    // Present the scene
                    view!.presentScene(scene, transition : SKTransition.doorsOpenVertical(withDuration: TimeInterval(1)))
                }
            }
            
            //dodati funkcionalnost na osnovu izabrane pozadine
            
            if atPoint(location).name == "selectBlue" {
                UserDefaults.standard.set("blue", forKey: "pColor")
                lblSelectBlue.text = "Selected"
                
                for label in labels {
                    if label.name != "selectBlue" {
                        label.text = "Select"
                    }
                }
            }
            
            if atPoint(location).name == "selectRed" {
                UserDefaults.standard.set("red", forKey: "pColor")
                lblSelectRed.text = "Selected"
                
                for label in labels {
                    if label.name != "selectRed" {
                        label.text = "Select"
                    }
                }
            }
            
            if atPoint(location).name == "selectWhite" {
                UserDefaults.standard.set("white", forKey: "pColor")
                lblSelectWhite.text = "Selected"
                
                for label in labels {
                    if label.name != "selectWhite" {
                        label.text = "Select"
                    }
                }
            }
            
            if atPoint(location).name == "selectYellow" {
                UserDefaults.standard.set("yellow", forKey: "pColor")
                lblSelectYellow.text = "Selected"
                
                for label in labels {
                    if label.name != "selectYellow" {
                        label.text = "Select"
                    }
                }
            }
         
        }
  
    }
    
    
}
