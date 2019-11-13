//
//  MenuVC.swift
//  PongPossible
//
//  Created by Marko Vukicevic on 9/27/18.
//  Copyright © 2018 Markan. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit



class MenuVC : SKScene {
    
    private var multi : SKSpriteNode?
    private var easy : SKSpriteNode?
    private var medium : SKSpriteNode?
    private var hard : SKSpriteNode?
    private var impossible : SKSpriteNode?
    private var stettings = SKSpriteNode()
 
    override func didMove(to view: SKView) {
        initScene()
        //za dugmice porbaj sa alfom kad se stisne i kad se pusti ekran da se alfa mijenja
        //bice simulacija da je dugme klknuto
        //dodam skshapenode kvadratnog oblika po diflotu pa je getujem kao i ostale node-ove
        //i onda je napravim kakvom ja hocu primjer u readlater na safariju
    }
    
    func initScene(){
        
       
        multi = childNode(withName: "Multiplayer") as? SKSpriteNode!
        easy = childNode(withName: "Easy") as? SKSpriteNode!
        medium = childNode(withName: "Medium") as? SKSpriteNode!
        hard = childNode(withName: "Hard") as? SKSpriteNode!
        impossible = childNode(withName: "Impossible") as? SKSpriteNode!
        stettings = childNode(withName: "Stettings") as! SKSpriteNode
        
        
        //pozicionira se stettings opcija dole lijevo
        stettings.position.x = (-self.frame.width / 2) + 50
        stettings.position.y = (-self.frame.height / 2) + 50
        
        //tekstura za stettings dugme, mora ovako jer nece preko scene gasi se xcode...
        let texture = SKTexture(imageNamed: "stettings")
        let action = SKAction.setTexture(texture)
        stettings.run(action)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            
            let location = touch.location(in: self)
            
            if atPoint(location).name == "Stettings" {
                //[amti izbor i kad kompajlujes ponovo igricu
                if let scene = StettingsScene(fileNamed: "StettingsScene") {
                    // Set the scale mode to scale to fit the window
                    scene.scaleMode = .aspectFill
                    scene.size = view!.bounds.size
                    // Present the scene
                    view!.presentScene(scene, transition : SKTransition.doorsOpenVertical(withDuration: TimeInterval(1)))
                }
               
            }
            
            
            if atPoint(location).name == "Multiplayer" {
              UserDefaults.standard.set("Multiplayer", forKey: "mode")
                if let scene = GameScene(fileNamed: "GameScene") {
                    // Set the scale mode to scale to fit the window
                    scene.scaleMode = .aspectFill
                    scene.size = view!.bounds.size
                    // Present the scene
                    view!.presentScene(scene, transition : SKTransition.doorsOpenVertical(withDuration: TimeInterval(1)))
                }
            }
            if atPoint(location).name == "Easy" {
                UserDefaults.standard.set("Easy", forKey: "mode")
                if let scene = GameScene(fileNamed: "GameScene") {
                    // Set the scale mode to scale to fit the window
                    scene.scaleMode = .aspectFill
                    scene.size = view!.bounds.size
                    // Present the scene
                    view!.presentScene(scene, transition : SKTransition.doorsOpenVertical(withDuration: TimeInterval(1)))
                }
            }
            if atPoint(location).name == "Medium" {
                UserDefaults.standard.set("Medium", forKey: "mode")
                if let scene = GameScene(fileNamed: "GameScene") {
                    // Set the scale mode to scale to fit the window
                    scene.scaleMode = .aspectFill
                    scene.size = view!.bounds.size
                    // Present the scene
                    view!.presentScene(scene, transition : SKTransition.doorsOpenVertical(withDuration: TimeInterval(1)))
                }
            }
            if atPoint(location).name == "Hard" {
                UserDefaults.standard.set("Hard", forKey: "mode")
                if let scene = GameScene(fileNamed: "GameScene") {
                    // Set the scale mode to scale to fit the window
                    scene.scaleMode = .aspectFill
                    scene.size = view!.bounds.size
                    // Present the scene
                    view!.presentScene(scene, transition : SKTransition.doorsOpenVertical(withDuration: TimeInterval(1)))
                }
            }
            if atPoint(location).name == "Impossible" {
                UserDefaults.standard.set("Impossible", forKey: "mode")
                if let scene = GameScene(fileNamed: "GameScene") {
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
