//
//  EndScene.swift
//  PongPossible
//
//  Created by Marko Vukicevic on 9/27/18.
//  Copyright © 2018 Markan. All rights reserved.
//

import Foundation
import SpriteKit



class EndScene: SKScene{
    
    var restartBtn : SKSpriteNode?
    var lbl : SKLabelNode?
    var mainmenuBtn : SKSpriteNode?
    var mode : String = UserDefaults.standard.string(forKey: "mode")!
    let notification = NotificationCenter.default
    var music = UserDefaults.standard.string(forKey: "music")
   override func didMove(to view: SKView) {
   
     initScene()
        
    }
    
    
    
    func initScene(){
        
        restartBtn = childNode(withName: "Restart") as? SKSpriteNode!
        lbl = childNode(withName: "winnerLabel") as? SKLabelNode!
        mainmenuBtn = childNode(withName: "MainMenu") as? SKSpriteNode!
        
        
        var s = UserDefaults.standard.string(forKey: "winner")
        
        lbl?.text = "Winner: " + s!
        
        if(music == "true"){
            notification.post(name: Notification.Name("PlayMusic"), object: nil)
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            
            let location = touch.location(in: self)
            
            if atPoint(location).name == "Restart" {
                
                UserDefaults.standard.set(mode, forKey: "mode")
                if let scene = GameScene(fileNamed: "GameScene") {
                    // Set the scale mode to scale to fit the window
                    scene.scaleMode = .aspectFill
                    scene.size = view!.bounds.size
                    // Present the scene
                    view!.presentScene(scene, transition : SKTransition.doorsOpenHorizontal(withDuration: TimeInterval(1)))
                }
            }
            if atPoint(location).name == "MainMenu" {
                if let scene = MMClass(fileNamed: "MMScene") {
                    // Set the scale mode to scale to fit the window
                    scene.scaleMode = .aspectFill
                    scene.size = view!.bounds.size
                    // Present the scene
                    view!.presentScene(scene, transition : SKTransition.moveIn(with: SKTransitionDirection.down, duration: TimeInterval(1.5)))
                }
            }
       
        }
    }
    
}
