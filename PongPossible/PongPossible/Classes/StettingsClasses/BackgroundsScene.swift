//
//  BackgroundsScene.swift
//  PongPossible
//
//  Created by Marko Vukicevic on 10/20/18.
//  Copyright © 2018 Markan. All rights reserved.
//

import SpriteKit


class BackgroundsScene: SKScene {
    
    //naparviti kao slajdove i stelice lijevo desno da bi se to fino vidjelo kad
    //korisnik bira pozadini
    
    var lblBlue = SKLabelNode()
    var lblRed = SKLabelNode()
    var lblWhite = SKLabelNode()
    var lblSelectBlue = SKLabelNode()
    var lblSelectRed = SKLabelNode()
    var lblSelectWhite = SKLabelNode()
    
    
    var bgBlue = SKSpriteNode()
    var bgRed = SKSpriteNode()
    var bgWhite = SKSpriteNode()
    var btnBack = SKSpriteNode()
    
    
    override func didMove(to view: SKView) {
        initScene()
    }
    
    func initScene(){
        
        lblRed = childNode(withName: "lblRed") as! SKLabelNode
        lblBlue = childNode(withName: "lblBlue") as! SKLabelNode
        lblWhite = childNode(withName: "lblWhite") as! SKLabelNode
        lblSelectBlue = childNode(withName: "selectBlue") as! SKLabelNode
        lblSelectRed = childNode(withName: "selectRed") as! SKLabelNode
        lblSelectWhite = childNode(withName: "selectWhite") as! SKLabelNode

        bgRed = childNode(withName: "red") as! SKSpriteNode
        bgBlue = childNode(withName: "blue") as! SKSpriteNode
        bgWhite = childNode(withName: "white") as! SKSpriteNode
        
        btnBack = childNode(withName: "backButton") as! SKSpriteNode
        
        btnBack.position.x = (self.frame.size.width/2) - 40
        btnBack.position.y = (-self.frame.size.height/2) + 50
        
        let texture = SKTexture(imageNamed: "backArrow")
        let action = SKAction.setTexture(texture)
        btnBack.run(action)
      
    }
    
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        let labels = [lblSelectBlue, lblSelectRed, lblSelectWhite]
        
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
                UserDefaults.standard.set("blue", forKey: "bgColor")
                lblSelectBlue.text = "Selected"
                
                for label in labels {
                    if label.name != "selectBlue" {
                        label.text = "Select"
                    }
                }
            }
                
            if atPoint(location).name == "selectRed" {
                UserDefaults.standard.set("red", forKey: "bgColor")
                lblSelectRed.text = "Selected"
                
                for label in labels {
                        if label.name != "selectRed" {
                            label.text = "Select"
                        }
                    }
            }
            
            if atPoint(location).name == "selectWhite" {
                UserDefaults.standard.set("white", forKey: "bgColor")
                lblSelectWhite.text = "Selected"
                
                for label in labels {
                    if label.name != "selectWhite" {
                        label.text = "Select"
                    }
                }
            }
                
                
        
            
        }
    }
    
    

    
    
    

}
