//
//  Player.swift
//  GajbaPive
//
//  Created by Marko Vukicevic on 9/20/18.
//  Copyright © 2018 S&M. All rights reserved.
//

import SpriteKit

class Player : SKSpriteNode {
    
    private var minX: CGFloat = 0.0, maxX: CGFloat = 0.0
    
    func initPlayer(){
    
        name = "Player"
        physicsBody = SKPhysicsBody(circleOfRadius: size.height / 2)
        physicsBody?.affectedByGravity = false
        physicsBody?.isDynamic = false
        physicsBody?.categoryBitMask = ColiderType.PLAYER
        physicsBody?.contactTestBitMask = ColiderType.JUICE_AND_BEER
    
    
    
    }
    
    
    
    
    
    func move(left : Bool, firstNumber: CGFloat, secondNumber: CGFloat){
        minX = firstNumber
        maxX = secondNumber
        var device = UIDevice.current.name
        
        if (device == "iPhone 7" || device == "iPhone 8" || device == "iPhone 6" || device == "iPhone 6s"){

            if left {
                position.x -= 25
                if self.position.x < minX{
                    position.x = minX
                }
            } else {
                position.x += 25
                if self.position.x > maxX{
                    position.x = maxX
                }
            }
        }
        
        if(device == "iPhone 7 Plus" || device == "iPhone 8 Plus" || device == "iPhone 6 Plus" || device == "iPhone 6s Plus"){
            
            if left {
                position.x -= 80
                if self.position.x < minX{
                    position.x = minX
                }
            } else {
                position.x += 80
                if self.position.x > maxX{
                    position.x = maxX
                }
            }
            
        }
        if(device == "iPhone X" || device == "iPhone XS"){
            if left {
                position.x -= 110
                if self.position.x < minX{
                    position.x = minX
                }
            } else {
                position.x += 110
                if self.position.x > maxX{
                    position.x = maxX
                }
            }
        }
        
        
        
    }
    
}



