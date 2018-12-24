//
//  EndGameSceneClass.swift
//  GajbaPive
//
//  Created by Marko Vukicevic on 9/24/18.
//  Copyright © 2018 S&M. All rights reserved.
//

import SpriteKit


class EndGameSceneClass: SKScene {
    
    private var scoreLabel : SKLabelNode?
    private var skor : String = ""
    var device = ""
    
    override func didMove(to view: SKView) {
        initGame()
    }
    
    func initGame(){
        
        device = UIDevice.current.name
        
        scoreLabel = childNode(withName: "ScoreLabel") as? SKLabelNode!
        
        
        
        
        skor = UserDefaults.standard.string(forKey: "skor")!
        scoreLabel?.text = "Your score is: " + skor
        
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            
            let location = touch.location(in: self)
            if atPoint(location).name == "restart" {
                if (device == "iPhone 7" || device == "iPhone 8" || device == "iPhone 6" || device == "iPhone 6s"){
                    if let scene = GameplaySceneClass(fileNamed: "GameplayScene") {
                        // Set the scale mode to scale to fit the window
                        scene.scaleMode = .aspectFill
                        
                        // Present the scene
                        view!.presentScene(scene, transition : SKTransition.doorsOpenHorizontal(withDuration: TimeInterval(1.5)))
                    }
            }
                
                if(device == "iPhone 7 Plus" || device == "iPhone 8 Plus" || device == "iPhone 6 Plus" || device == "iPhone 6s Plus"){
                    if let scene = GameplaySceneClass(fileNamed: "GameplayScenePlus") {
                        // Set the scale mode to scale to fit the window
                        scene.scaleMode = .aspectFill
                        
                        // Present the scene
                        view!.presentScene(scene, transition : SKTransition.doorsOpenHorizontal(withDuration: TimeInterval(1.5)))
                    }

                    
                    
                }
                if(device == "iPhone X" || device == "iPhone XS"){
                    if let scene = GameplaySceneClass(fileNamed: "GameplaySceneX") {
                        // Set the scale mode to scale to fit the window
                        scene.scaleMode = .aspectFill
                        
                        // Present the scene
                        view!.presentScene(scene, transition : SKTransition.doorsOpenHorizontal(withDuration: TimeInterval(1.5)))
                    }
                }
            
            
        }
    }
    
    
}


}

