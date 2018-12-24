//
//  MainMenuScene.swift
//  GajbaPive
//
//  Created by Marko Vukicevic on 9/20/18.
//  Copyright © 2018 S&M. All rights reserved.
//

import SpriteKit

class MainMenuScene: SKScene {

    let device = UIDevice.current.name
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            
            let location = touch.location(in: self)
                if atPoint(location).name == "Start" {
                    if (device == "iPhone 7" || device == "iPhone 8" || device == "iPhone 6" || device == "iPhone 6s"){
                        if let scene = GameplaySceneClass(fileNamed: "GameplayScene") {
                            // Set the scale mode to scale to fit the window
                            scene.scaleMode = .aspectFill
                            
                            // Present the scene
                            view!.presentScene(scene, transition : SKTransition.doorsOpenVertical(withDuration: TimeInterval(1.5)))
                        }
                    }
                    
                    if(device == "iPhone 7 Plus" || device == "iPhone 8 Plus" || device == "iPhone 6 Plus" || device == "iPhone 6s Plus"){
                        if let scene = GameplaySceneClass(fileNamed: "GameplayScenePlus") {
                            // Set the scale mode to scale to fit the window
                            scene.scaleMode = .aspectFill
                            
                            // Present the scene
                            view!.presentScene(scene, transition : SKTransition.doorsOpenVertical(withDuration: TimeInterval(1.5)))
                        }
                    }
                    if(device == "iPhone X" || device == "iPhone XS"){
                        if let scene = GameplaySceneClass(fileNamed: "GameplaySceneX") {
                            // Set the scale mode to scale to fit the window
                            scene.scaleMode = .aspectFill
                            
                            // Present the scene
                            view!.presentScene(scene, transition : SKTransition.doorsOpenVertical(withDuration: TimeInterval(1.5)))
                        }
                    }
                    
                }
            }
        }
    
    }
