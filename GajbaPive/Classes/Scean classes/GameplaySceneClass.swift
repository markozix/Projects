//
//  GameplaySceneClass.swift
//  GajbaPive
//
//  Created by Marko Vukicevic on 9/20/18.
//  Copyright © 2018 S&M. All rights reserved.
//

import SpriteKit


class GameplaySceneClass : SKScene, SKPhysicsContactDelegate {
    
    private var player: Player?
    private var center = CGFloat()
    private var canMove = false, moveLeft = false
    private var itemController = ItemController()
    private var scoreLabel : SKLabelNode?
    private var score = 0
    private var livesScore: SKLabelNode?
    private var lives = 3
    var device = ""
    var skView: SKView?
    
    override func didMove(to view: SKView) {
        initGame()
        skView?.preferredFramesPerSecond = 60
        
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        managePlayer()
        decreseLife()
      
      
        
   
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let location = touch.location(in: self)
            
            if location.x > center {
                moveLeft = false
            }else{
                moveLeft = true
            }
            
            
            
        }
        canMove = true
    }
    
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        canMove = false
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        var firstBody = SKPhysicsBody()
        var secondBody = SKPhysicsBody()
       
        
        
        if contact.bodyA.node?.name == "Player" {
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        } else {
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
        
        
        
        if firstBody.node?.name == "Player" && secondBody.node?.name == "beer 1" {
            
            score += 3
            scoreLabel?.text = String(score)
            secondBody.node?.removeFromParent()
            
        }
        if firstBody.node?.name == "Player" && secondBody.node?.name == "beer 2"{
            score += 2
            scoreLabel?.text = String(score)
            secondBody.node?.removeFromParent()
        }
        if firstBody.node?.name == "Player" && secondBody.node?.name == "beer 3"{
            score += 1
            scoreLabel?.text = String(score)
            secondBody.node?.removeFromParent()
        }
        if firstBody.node?.name == "Player" && secondBody.node?.name == "beer 4"{
            score += 1
            scoreLabel?.text = String(score)
            secondBody.node?.removeFromParent()
        }
        if firstBody.node?.name == "Player" && secondBody.node?.name == "beer 5"{
            score += 1
            scoreLabel?.text = String(score)
            secondBody.node?.removeFromParent()
        }
        
        if firstBody.node?.name == "Player" && secondBody.node?.name == "juice" {
            
            firstBody.node?.removeFromParent()
            secondBody.node?.removeFromParent()
            
            //stavljamo text iz skora u userdefaults da bi ga povukli u endgame sceni
            UserDefaults.standard.set(scoreLabel?.text, forKey: "skor")
            
            
           // Timer.scheduledTimer(timeInterval: TimeInterval(0.5), target: self, selector: #selector(GameplaySceneClass.restartGame), userInfo: nil, repeats: false)
            if let scene = EndGameSceneClass(fileNamed: "EndGameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view!.presentScene(scene, transition : SKTransition.doorsOpenVertical(withDuration: TimeInterval(1.5)))
                
            }

            
        }
        
    }
    
    // treba napraviti za X ajfone varijantu gameplay scene i to bi bilo to
    
    private func initGame(){
        
        physicsWorld.contactDelegate = self
        
        player = childNode(withName: "Player") as? Player!
        player?.initPlayer()
        
        scoreLabel = childNode(withName: "ScoreLabel") as? SKLabelNode!
        scoreLabel?.text = "0"
        
        livesScore = childNode(withName: "LivesLabel") as? SKLabelNode!
        livesScore?.text = "Lives: 3"
        
        print(scene!.frame.width)
        center = self.frame.size.width / self.frame.size.height
        
        device = UIDevice.current.name
        
        
        
         if(device == "iPhone 7 Plus" || device == "iPhone 8 Plus" || device == "iPhone 6 Plus" || device == "iPhone 6s Plus"){
            Timer.scheduledTimer(timeInterval: TimeInterval(itemController.randomBetweenNumbers(firstNum: 1.25, secondNum: 1.6)), target: self, selector: #selector(GameplaySceneClass.spawnItems), userInfo: nil, repeats: true)
         }else {
             Timer.scheduledTimer(timeInterval: TimeInterval(itemController.randomBetweenNumbers(firstNum: 2, secondNum: 2.6)), target: self, selector: #selector(GameplaySceneClass.spawnItems), userInfo: nil, repeats: true)
        }
        
        
        Timer.scheduledTimer(timeInterval: TimeInterval(3), target: self, selector: #selector(GameplaySceneClass.removeItems), userInfo: nil, repeats: true)
        
   
        
    }
    
    private func managePlayer(){
        
        if canMove{
            // proslijediti sirinu scene radi mijenjanja rezolucije kako bi svaki put radilo kako treba
            if(device == "iPhone 7 Plus" || device == "iPhone 8 Plus" || device == "iPhone 6 Plus" || device == "iPhone 6s Plus"){
                player?.move(left: moveLeft, firstNumber: -420, secondNumber: 420)
            }
             if (device == "iPhone 7" || device == "iPhone 8" || device == "iPhone 6" || device == "iPhone 6s"){
                player?.move(left: moveLeft, firstNumber: -287, secondNumber: 287)
             }
            if(device == "iPhone X" || device == "iPhone XS"){
                player?.move(left: moveLeft, firstNumber: -445, secondNumber: 445)
            }
        
    }
}
    @objc func spawnItems() {
        if(device == "iPhone 7 Plus" || device == "iPhone 8 Plus" || device == "iPhone 6 Plus" || device == "iPhone 6s Plus"){
            self.scene?.addChild(itemController.spawnItems(firstNumber: -420, secondNumber: 420))
        }
        if (device == "iPhone 7" || device == "iPhone 8" || device == "iPhone 6" || device == "iPhone 6s"){
            self.scene?.addChild(itemController.spawnItems(firstNumber: -287, secondNumber: 287))
        }
        if(device == "iPhone X" || device == "iPhone XS"){
            self.scene?.addChild(itemController.spawnItems(firstNumber: -445, secondNumber: 445))
        }
       
    }
    
    //ne koristi se
    @objc func restartGame() {
        if let scene = GameplaySceneClass(fileNamed: "GameplayScene"){
            scene.scaleMode = .aspectFill
            view?.presentScene(scene, transition : SKTransition.reveal(with: SKTransitionDirection.down, duration: TimeInterval(2)))
            
            
        }
    }
    
    @objc func removeItems(){
    
    
        for child in children {
            if (child.name == "beer 1" || child.name == "beer 2" || child.name == "beer 3" || child.name == "beer 4" || child.name == "beer 5" || child.name == "juice") {
                if child.position.y < -self.scene!.frame.height - 50{
                    child.removeFromParent()
                }
            }
        }
    
    
    
    }
    
    
    
    
        func decreseLife(){
        
        for child in children {
            if (child.name == "beer 1" || child.name == "beer 2" || child.name == "beer 3" || child.name == "beer 4" || child.name == "beer 5") {
                if child.position.y < -self.scene!.frame.height {
                    
                    child.removeFromParent()
                    if(lives == 1){
                        
                        UserDefaults.standard.set(scoreLabel?.text, forKey: "skor")
                        
                        if let scene = EndGameSceneClass(fileNamed: "EndGameScene") {
                            // Set the scale mode to scale to fit the window
                            scene.scaleMode = .aspectFill
                            
                            // Present the scene
                            view!.presentScene(scene, transition : SKTransition.doorsOpenVertical(withDuration: TimeInterval(1)))
                            
                        }
                        
                        
                    }
                    lives -= 1
                    livesScore?.text = "Lives: \(lives)"
                }
            }
        }
        
        
    }
    
    
   
    
    
    
    
    
}
