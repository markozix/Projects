//
//  ItemController.swift
//  GajbaPive
//
//  Created by Marko Vukicevic on 9/21/18.
//  Copyright © 2018 S&M. All rights reserved.
//

import SpriteKit

struct ColiderType{
    static let PLAYER : UInt32 = 0
    static let JUICE_AND_BEER: UInt32 = 1
}


class ItemController {
    
    private var minX: CGFloat?, maxX: CGFloat?
   
    
    func spawnItems(firstNumber: CGFloat, secondNumber: CGFloat) -> SKSpriteNode {
        let item: SKSpriteNode?
        minX = firstNumber
        maxX = secondNumber
        if Int(randomBetweenNumbers(firstNum: 0, secondNum: 10)) >= 6 {
            item = SKSpriteNode(imageNamed: "juice")
            item!.name = "juice"
            if(Int(maxX!) < 420){
                 item!.setScale(0.5)
            }else {
            item!.setScale(0.7)
            }
            item?.physicsBody = SKPhysicsBody(circleOfRadius: item!.size.height / 2)
        } else {
            let num = Int(randomBetweenNumbers(firstNum: 1, secondNum: 6))
            
            
            
            item = SKSpriteNode(imageNamed: "beer \(num)")
            item!.name = "beer \(num)"
            if(Int(maxX!) < 420){
                item!.setScale(0.5)
            }else {
                item!.setScale(0.7)
            }
            item!.physicsBody = SKPhysicsBody(circleOfRadius: item!.size.height / 2)
            
            
        }
        
        item!.physicsBody?.categoryBitMask = ColiderType.JUICE_AND_BEER
        item!.zPosition = 3;
        item!.anchorPoint = CGPoint(x: 0.5, y: 0.5)
       
        item!.position.x = randomBetweenNumbers(firstNum: minX!, secondNum: maxX!)
        if(Int(maxX!) < 420){
        item!.position.y = 700
        }else{
            item!.position.y = 1200
        }
        
        return item!
    }
 
    
    
    func randomBetweenNumbers(firstNum : CGFloat, secondNum : CGFloat) -> CGFloat {
        
        return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNum - secondNum) + min(firstNum, secondNum)
    }
    
    
    
}







