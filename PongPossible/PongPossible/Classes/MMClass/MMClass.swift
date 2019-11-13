//
//  MMClass.swift
//  PongPossible
//
//  Created by Marko Vukicevic on 2/8/19.
//  Copyright © 2019 Markan. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit
import AVFoundation

class MMClass : SKScene {
    
    private var stet = SKShapeNode()
    private var multi = SKShapeNode()
 /*   private var easy = SKShapeNode()
    private var medium = SKShapeNode()
    private var hard = SKShapeNode()
    private var impossible = SKShapeNode()
 */
    private var stetShape = SKShapeNode()
    private var stettings = SKSpriteNode()
    
    private var singleplayer = SKShapeNode()
    private var custom = SKShapeNode()
    private var modes = SKShapeNode()
    var btnOnOff = SKShapeNode()
    var lblOnOff = SKLabelNode()
    var lblRestore = SKLabelNode()
    var btnOnOff2 = SKShapeNode()
    var lblOnOff2 = SKLabelNode()
    var lblMusic = SKLabelNode()
    var lblSoundFX = SKLabelNode()
    
    var restore = SKShapeNode()
    
    private var lblSingle = SKLabelNode()
    private var lblMulti = SKLabelNode()
    private var lblLevels = SKLabelNode()
    private var lblCustom = SKLabelNode()
    private var lblStettings = SKLabelNode()
    private var lblModes = SKLabelNode()
    
    var hit : String = UserDefaults.standard.string(forKey: "hit") ?? "true"
    var music : String = UserDefaults.standard.string(forKey: "music") ?? "true"
    
    let notification = NotificationCenter.default
    var device = ""
    
    
    
    var prikazano = false
    
    
    
    override func didMove(to view: SKView) {
        phoneModel()
        initScene()
        
    }
    
    
    func initScene(){
        
        //dodati opciju "More" gdje ce biti ponudjeni wall mode i bomb mod igre!!!!!!!!!!!!
        
        multi = childNode(withName: "Multiplayer") as! SKShapeNode
        stetShape = childNode(withName: "StettingsShape") as! SKShapeNode
        lblCustom = childNode(withName: "lblCustom") as! SKLabelNode
        lblSingle = childNode(withName: "lblSingleplayer") as! SKLabelNode
        lblMulti = childNode(withName: "lblMultiplayer") as! SKLabelNode
        lblModes = childNode(withName: "lblModes") as! SKLabelNode

        stettings = childNode(withName: "Stettings") as! SKSpriteNode
        modes = childNode(withName: "Modes") as!  SKShapeNode
        singleplayer = childNode(withName: "Singleplayer") as! SKShapeNode
        custom = childNode(withName: "Custom") as! SKShapeNode
        
        stettings.position.x = (-self.frame.width / 2) + 50
        stettings.position.y = (-self.frame.height / 2) + 50
        
        let texture = SKTexture(imageNamed: "stettings")
        let action = SKAction.setTexture(texture)
        stettings.run(action)
        
        btnOnOff = stetShape.childNode(withName: "btnOnOff") as! SKShapeNode
        lblOnOff = stetShape.childNode(withName: "lblOnOff") as! SKLabelNode
        if(music == "true"){
            lblOnOff.text = "On"
        }else{
            lblOnOff.text = "Off"
        }
        
        lblRestore = stetShape.childNode(withName: "lblRestore") as! SKLabelNode
        restore = stetShape.childNode(withName: "Restore") as! SKShapeNode
        lblOnOff2 = stetShape.childNode(withName: "lblOnOff2") as! SKLabelNode
        if(hit == "true"){
            lblOnOff2.text = "On"
            
        }else{
            lblOnOff2.text = "Off"
            
        }
        
        btnOnOff2 = stetShape.childNode(withName: "btnOnOff2") as! SKShapeNode
        lblMusic = stetShape.childNode(withName: "lblMusic") as! SKLabelNode
        lblSoundFX = stetShape.childNode(withName: "lblSoundFX") as! SKLabelNode
        
        popuniShape()
        
    }
    
    
    func phoneModel(){
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        if screenWidth.isEqual(to: 375.0) && screenHeight.isEqual(to: 667.0) {
            device = "iPhone 7"
        }else if screenWidth.isEqual(to: 414.0) && screenHeight.isEqual(to: 736.0) {
            device = "iPhone 7 Plus"
        }else if screenWidth.isEqual(to: 320.0) && screenHeight.isEqual(to: 568.0) {
            device = "iPhone SE"
        }else if screenWidth.isEqual(to: 375.0) && screenHeight.isEqual(to: 812.0) {
            device = "iPhone X"
        }else if screenWidth.isEqual(to: 768.0) && screenHeight.isEqual(to: 1024.0) {
            device = "iPad 9.7"
        }
        
    }
    
    func popuniShape(){
        
        singleplayer.path = UIBezierPath(roundedRect: CGRect(x: -200, y: -100, width: 400.0, height: 70.0), cornerRadius: 75.0).cgPath
        singleplayer.fillColor = UIColor.black
        lblSingle.position = CGPoint(x: 0, y: 94)
        
        multi.path = UIBezierPath(roundedRect: CGRect(x: -200, y: -120, width: 400.0, height: 70.0), cornerRadius: 75.0).cgPath
        multi.fillColor = UIColor.black
        lblMulti.position = CGPoint(x: 0, y: 3)
        
        custom.path = UIBezierPath(roundedRect: CGRect(x: -200, y: -140, width: 400.0, height: 70.0), cornerRadius: 75.0).cgPath
        custom.fillColor = UIColor.black
        lblCustom.position = CGPoint(x: 0, y: -86)
        
        modes.path = UIBezierPath(roundedRect: CGRect(x: -200, y: -160, width: 400.0, height: 70.0), cornerRadius: 75.0).cgPath
        modes.fillColor = UIColor.black
        lblModes.position = CGPoint(x: 0, y: -175)
        
        
        if device == "iPhone 7"{
            stetShape.path = UIBezierPath(roundedRect: CGRect(x: -self.size.width/2.5, y: -self.frame.size.height/2.5, width: self.size.width-86, height: self.size.height-237), cornerRadius: 40.0).cgPath
            restore.path = UIBezierPath(roundedRect: CGRect(x: -323, y: -26, width: 276, height: 30), cornerRadius: 90.0).cgPath
        }else if device == "iPhone 7 Plus"{
            stetShape.path = UIBezierPath(roundedRect: CGRect(x: -self.size.width/2.5, y: -self.frame.size.height/2.5, width: self.size.width-89, height: self.size.height-260), cornerRadius: 40.0).cgPath
            restore.path = UIBezierPath(roundedRect: CGRect(x: -330, y: -25, width: 290, height: 30), cornerRadius: 90.0).cgPath
        }else if device == "iPhone X" {
            stetShape.path = UIBezierPath(roundedRect: CGRect(x: -self.size.width/2.5, y: -self.frame.size.height/2.5, width: self.size.width-85, height: self.size.height-300), cornerRadius: 40.0).cgPath
            restore.path = UIBezierPath(roundedRect: CGRect(x: -330, y: -25, width: 290, height: 30), cornerRadius: 90.0).cgPath
        }
        btnOnOff.path = UIBezierPath(roundedRect: CGRect(x: -70, y: -30, width: 150, height: 90), cornerRadius: 90.0).cgPath
        btnOnOff2.path = UIBezierPath(roundedRect: CGRect(x: -70, y: -60, width: 150, height: 90), cornerRadius: 90.0).cgPath
        
        stetShape.zPosition = -2
        stetShape.isHidden = true
        
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches{
            
            let location = touch.location(in: self)
            
            if atPoint(location).name == "lblCustom" || atPoint(location).name == "Custom" {
                custom.fillColor = UIColor.white.withAlphaComponent(0.15)
                if let scene = StettingsScene(fileNamed: "StettingsScene") {
                    // Set the scale mode to scale to fit the window
                    scene.scaleMode = .aspectFill
                    scene.size = view!.bounds.size
                    // Present the scene
                    view!.presentScene(scene, transition : SKTransition.doorsOpenVertical(withDuration: TimeInterval(0.8)))
                }
                
            }
            
            if atPoint(location).name == "lblMultiplayer" || atPoint(location).name == "Multiplayer" {
                multi.fillColor = UIColor.white.withAlphaComponent(0.15)
                UserDefaults.standard.set("Multiplayer", forKey: "mode")
                if let scene = GameScene(fileNamed: "GameScene") {
                    // Set the scale mode to scale to fit the window
                    scene.scaleMode = .aspectFill
                    scene.size = view!.bounds.size
                    // Present the scene
                    view!.presentScene(scene, transition : SKTransition.doorsOpenVertical(withDuration: TimeInterval(0.8)))
                }
            }
            
            if atPoint(location).name == "lblSingleplayer" || atPoint(location).name == "Singleplayer" {
                singleplayer.fillColor = UIColor.white.withAlphaComponent(0.15)
                
                if let scene = LevelsClass(fileNamed: "LevelsScene") {
                    // Set the scale mode to scale to fit the window
                    scene.scaleMode = .aspectFill
                    scene.size = view!.bounds.size
                    // Present the scene
                    view!.presentScene(scene, transition : SKTransition.doorsOpenVertical(withDuration: TimeInterval(0.8)))
                }
            }
            
            if atPoint(location).name == "lblModes" || atPoint(location).name == "Modes" {
                modes.fillColor = UIColor.white.withAlphaComponent(0.15)
                
             
            }
            
            
            if atPoint(location).name != "StettingsShape" && atPoint(location).name != "lblOnOff" && atPoint(location).name != "lblOnOff2" && atPoint(location).name != "lblRestore" && atPoint(location).name != "Restore" && atPoint(location).name != "btnOnOff" && atPoint(location).name != "btnOnOff2" && atPoint(location).name != "lblMusic" && atPoint(location).name != "lblSoundFX" {
                
                    stetShape.isHidden = true
                
            }
            
            
            if atPoint(location).name == "Stettings" {
                stetShape.zPosition = 3
                stetShape.isHidden = false
                prikazano = true
                
            }
            
            
            
            if atPoint(location).name == "lblOnOff" || atPoint(location).name == "btnOnOff" {
                btnOnOff.fillColor = UIColor.white.withAlphaComponent(0.15)
                if lblOnOff.text == "On" {
                    UserDefaults.standard.set("false", forKey: "music")
                    lblOnOff.text = "Off"
                    notification.post(name: Notification.Name("StopMusic"), object: nil)
                    //ovde ugasiti muziku
                }else{
                    lblOnOff.text = "On"
                    UserDefaults.standard.set("true", forKey: "music")
                    notification.post(name: Notification.Name("PlayMusic"), object: nil)
                }
            }
            
            if atPoint(location).name == "lblOnOff2" || atPoint(location).name == "btnOnOff2" {
                btnOnOff2.fillColor = UIColor.white.withAlphaComponent(0.15)
                if lblOnOff2.text == "On" {
                    lblOnOff2.text = "Off"
                    //ovdje ugasiti efekte
                    UserDefaults.standard.set("false", forKey: "hit")
                }else{
                    lblOnOff2.text = "On"
                    UserDefaults.standard.set("true", forKey: "hit")
                }
            }
            
            if atPoint(location).name == "Restore" || atPoint(location).name == "lblRestore" {
                restore.fillColor = UIColor.white.withAlphaComponent(0.15)
                lblOnOff.text = "On"
                lblOnOff2.text = "On"
                UserDefaults.standard.set("true", forKey: "hit")
                UserDefaults.standard.set("true", forKey: "music")
                notification.post(name: Notification.Name("PlayMusic"), object: nil)
                
            }
            
            
            
        
    }
}
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches{
            
            let location = touch.location(in: self)
            
            if atPoint(location).name == "lblSingleplayer" || atPoint(location).name == "Singleplayer" {
                singleplayer.fillColor = UIColor.black
            }
            
            if atPoint(location).name == "lblMultiplayer" || atPoint(location).name == "Multiplayer" {
               multi.fillColor = UIColor.black
            }
            
            if atPoint(location).name == "lblCustom" || atPoint(location).name == "Custom" {
                custom.fillColor = UIColor.black
            }
            
            if atPoint(location).name == "lblModes" || atPoint(location).name == "Modes" {
                modes.fillColor = UIColor.black
            }
            
            if atPoint(location).name == "lblOnOff" || atPoint(location).name == "btnOnOff" {
                btnOnOff.fillColor = UIColor.black
            }
            
            if atPoint(location).name == "lblOnOff2" || atPoint(location).name == "btnOnOff2" {
                btnOnOff2.fillColor = UIColor.black
            }
            
            if atPoint(location).name == "Restore" || atPoint(location).name == "lblRestore" {
                restore.fillColor = UIColor.black
                
            }
  
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    
    
}
