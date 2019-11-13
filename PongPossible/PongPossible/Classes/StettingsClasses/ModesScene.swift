//
//  ModesScene.swift
//  PongPossible
//
//  Created by Marko Vukicevic on 11/2/18.
//  Copyright © 2018 Markan. All rights reserved.
//



import SpriteKit


class ModesScene : SKScene {

    
    
    var lblSlow = SKLabelNode()
    var lblNormal = SKLabelNode()
    var lblFast = SKLabelNode()
    
    var lblS = SKLabelNode()
    var lblN = SKLabelNode()
    var lblF = SKLabelNode()
    
    var lblTitle1 = SKLabelNode()
    var lblTitle2 = SKLabelNode()
    
    var p11 = SKSpriteNode()
    var p21 = SKSpriteNode()
    
    var lbl11 = SKLabelNode()
    var lbl21 = SKLabelNode()
    
    var btnBack = SKSpriteNode()
    
    
    override func didMove(to view: SKView) {
        
      initScene()
        
    }
    
    
    
    
    func initScene(){
    
        
        lblS = childNode(withName: "lblS") as! SKLabelNode
        lblN = childNode(withName: "lblN") as! SKLabelNode
        lblF = childNode(withName: "lblF") as! SKLabelNode
        
        lblSlow = childNode(withName: "lblSlow") as! SKLabelNode
        lblNormal = childNode(withName: "lblNormal") as! SKLabelNode
        lblFast = childNode(withName: "lblFast") as! SKLabelNode
        
        lblTitle1 = childNode(withName: "TitleGameMode") as! SKLabelNode
        lblTitle2 = childNode(withName: "TitleBallSpeed") as! SKLabelNode
        
        lbl11 = childNode(withName: "mode11") as! SKLabelNode
        lbl21 = childNode(withName: "mode21") as! SKLabelNode
        
        p11 = childNode(withName: "points11") as! SKSpriteNode
        p21 = childNode(withName: "points21") as! SKSpriteNode
        
        btnBack = childNode(withName: "backButton") as! SKSpriteNode
        
        btnBack.position.x = (self.frame.size.width/2) - 40
        btnBack.position.y = (-self.frame.size.height/2) + 50
        
        let texture = SKTexture(imageNamed: "backArrow")
        let action = SKAction.setTexture(texture)
        btnBack.run(action)
        
        //texture za points11 i points21 treba da se nadju i odrade
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let labels = [lblSlow, lblNormal, lblFast]
        
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
    
            if atPoint(location).name == "points11" {
                //treba textura za oba da se odradi gore da se inicijalizuje da bi se dalje radilo
                UserDefaults.standard.set("11", forKey: "modeTo")
            }
            
            if atPoint(location).name == "points21" {
                
                 UserDefaults.standard.set("21", forKey: "modeTo")
                
            }
            
            
            
            if atPoint(location).name == "lblSlow" {
                UserDefaults.standard.set("slow", forKey: "BallSpeed")
                lblSlow.text = "Selected"
                
                for label in labels {
                    if label.name != "lblSlow" {
                        label.text = "Select"
                    }
                }
            }
            if atPoint(location).name == "lblNormal" {
                UserDefaults.standard.set("normal", forKey: "BallSpeed")
                lblNormal.text = "Selected"
                
                for label in labels {
                    if label.name != "lblNormal" {
                        label.text = "Select"
                    }
                }
            }
            if atPoint(location).name == "lblFast" {
                UserDefaults.standard.set("fast", forKey: "BallSpeed")
                lblFast.text = "Selected"
                
                for label in labels {
                    if label.name != "lblFast" {
                        label.text = "Select"
                    }
                }
            }

    

    
        }
        
    }

}




























