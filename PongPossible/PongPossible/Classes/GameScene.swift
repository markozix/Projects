//
//  GameScene.swift
//  PongPossible
//
//  Created by Marko Vukicevic on 9/27/18.
//  Copyright © 2018 Markan. All rights reserved.
//

import SpriteKit
import GameplayKit



class GameScene: SKScene , SKPhysicsContactDelegate {
    var ball = SKSpriteNode()
    var enemy = SKSpriteNode()
    var main = SKSpriteNode()
    var device = ""
    var speedOfBall : Int = 0
    var ballLocation : CGFloat = 0
    var locGlobalX : CGFloat = 0
    var locGlobalY : CGFloat = 0
    var velocity = CGVector(dx: 0, dy: 0)
    var timer : Timer!
    var hit = UserDefaults.standard.string(forKey: "hit")
    
    //muzika za hit
    let notification = NotificationCenter.default
   
    
    var bgColor : String = UserDefaults.standard.string(forKey: "bgColor") ?? "black"
    var paddleColor : String = UserDefaults.standard.string(forKey: "pColor") ?? "white"
    
    var ballType : String = UserDefaults.standard.string(forKey: "ballType") ?? "default"
    
     var score = [Int]()
    
    var toplbl = SKLabelNode()
    var bottomlbl = SKLabelNode()
    
    var mode : String = UserDefaults.standard.string(forKey: "mode")!
    
    // bira se mod do 11 ili 21
    var modeTo : String = UserDefaults.standard.string(forKey: "modeTo") ?? "11"
    
    //bira se brzina loptice, treba odraditi implementaiju za sada samo se mod prosljedjuje
    var ballSpeed : String = UserDefaults.standard.string(forKey: "BallSpeed") ?? "normal"
    
    override func didMove(to view: SKView) {

        physicsWorld.contactDelegate = self
        notification.post(name: Notification.Name("StopMusic"), object: nil)
        
        ball = self.childNode(withName: "ball") as! SKSpriteNode
        enemy = self.childNode(withName: "enemy") as! SKSpriteNode
        main = self.childNode(withName: "main") as! SKSpriteNode
        toplbl = self.childNode(withName: "topLabel") as! SKLabelNode
        bottomlbl = self.childNode(withName: "bottomLabel") as! SKLabelNode
        
        //promjena pozadine napravljena
        changeBGColor()
        
        //vrsta loptice
        changeBall()
        
        //boja reketa
        changePaddlesColor()
        
        //racuna se rezolucija ekrana i dodjela imena modela
        phoneModel()
        // namjestamo "rekete" za drugaciju rezoluciji
        reSize(device: device)
        
        determineBallSpeed()
        
        enemy.position.y = (self.frame.height / 2) - 80
        main.position.y = (-self.frame.height / 2) + 80
        
        
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        border.friction = 0
        border.restitution = 1
        
        self.physicsBody = border
        
        startGame()
        
        timer = Timer.scheduledTimer(timeInterval: 7, target: self, selector: #selector(increaseBallSpeed), userInfo: nil, repeats: true)

        
    }
    
    //funkcija za ubrzanje lopte
    @objc func increaseBallSpeed() {
    
        speedOfBall += 1
        
    }
    
    func ballDirectionCheck() {
        
        var tempX : CGFloat = 0
        var tempY : CGFloat = 0
        
        tempX = ball.position.x
        tempY = ball.position.y
        
        //ovde ubrzanje loptice nekako implementirati da se poveca ballOfSpeed mozda
        
        if tempY >= 0{
            if tempX <= locGlobalX {
                ball.physicsBody?.applyImpulse(CGVector(dx: -speedOfBall, dy: -speedOfBall))
            }else{
                ball.physicsBody?.applyImpulse(CGVector(dx: speedOfBall, dy: -speedOfBall))
            }
        }else{
            if tempX <= locGlobalX {
                ball.physicsBody?.applyImpulse(CGVector(dx: -speedOfBall, dy: speedOfBall))
            }else{
                ball.physicsBody?.applyImpulse(CGVector(dx: speedOfBall, dy: speedOfBall))
            }
        }
      
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        
        var firstBody = SKPhysicsBody()
        var secondBody = SKPhysicsBody()

        
        // uvijek je prvo tijelo lopta
        if contact.bodyA.node?.name == "ball" {
            firstBody = contact.bodyA
            secondBody = contact.bodyB
            
        } else {
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
        
        if (firstBody.node?.name == "ball" && secondBody.node?.name == "main"){
            //dodaj if za uslov kada nema soundFX-a da ne ulaiz da salje notifikaciju za zvuk
            //test za hit
            if(hit == "true"){
                notification.post(name: Notification.Name("PlayHit"), object: nil)
            }
            ball.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
            ballDirectionCheck()
        }else if(firstBody.node?.name == "ball" && secondBody.node?.name == "enemy"){
            if(hit == "true"){
                notification.post(name: Notification.Name("PlayHit"), object: nil)
            }
            ball.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
            ballDirectionCheck()
            
        }else if(firstBody.node?.name == "ball"){
            if(hit == "true"){
            notification.post(name: Notification.Name("PlayHit"), object: nil)
            }
        }
        
        // update za posljednju poziciju sudara prije reketa
        locGlobalX = ball.position.x
        locGlobalY = ball.position.y
        
    }
    
    func determineBallSpeed(){
        if device == "iPhone 7" || device == "iPhone 7 Plus" || device == "iPhone SE" || device == "iPhone X" {
            speedOfBall = 22
        }else if device == "iPad 9.7" {
            speedOfBall = 32
        }
        
        switch ballSpeed {
        case "slow":
            speedOfBall = speedOfBall - 10
        case "fast":
            speedOfBall = speedOfBall + 10
        default:
            speedOfBall = speedOfBall + 0
        }
        
    }
    
    func changeBall(){
    
        if ballType == "default" {
            
            let textureD = SKTexture(imageNamed: "ball")
            let actionD = SKAction.setTexture(textureD)
            ball.run(actionD)
            
        }else if ballType == "blue" {
            
            let textureB = SKTexture(imageNamed: "blueball")
            let actionB = SKAction.setTexture(textureB)
            ball.run(actionB)
            
        }else if ballType == "red" {
            
            let textureR = SKTexture(imageNamed: "redball")
            let actionR = SKAction.setTexture(textureR)
            ball.run(actionR)
            
        }else if ballType == "beach" {
            
            let textureBb = SKTexture(imageNamed: "beachball")
            let actionBb = SKAction.setTexture(textureBb)
            ball.run(actionBb)
            
        }
 
    }
    
    func changePaddlesColor(){
        
        if paddleColor == "black" {
            enemy.color = .black
            main.color = .black
        } else if paddleColor == "white" {
            enemy.color = .white
            main.color = .white
        } else if paddleColor == "red" {
            enemy.color = .red
            main.color = .red
        } else if paddleColor == "blue" {
            enemy.color = .blue
            main.color = .blue
        } else if paddleColor == "yellow" {
            enemy.color = .yellow
            main.color = .yellow
        }
   
    }
    
    func changeBGColor(){
        
        if bgColor == "red" {
            self.backgroundColor = UIColor.red
            
        }else if bgColor == "blue" {
            self.backgroundColor = UIColor.blue
            
        }else if bgColor == "white" {
            enemy.color = .black
            main.color = .black
            toplbl.fontColor = UIColor.black
            bottomlbl.fontColor = UIColor.black
            self.backgroundColor = UIColor.white
            
        }else if bgColor == "black" {
            self.backgroundColor = UIColor.black
            
        }
        
    }
    
    func startGame(){
     
        score = [0,0]
        toplbl.text = "\(score[1])"
        bottomlbl.text = "\(score[0])"
        ball.physicsBody?.applyImpulse(CGVector(dx: speedOfBall, dy: speedOfBall))
        
    }
    
    func addScore(playerWhoWon: SKSpriteNode){
        
        //dodati muziku!!!!!!!!!!!!!!
        
        ball.position = CGPoint(x: 0, y: 0)
        ball.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
        
        if playerWhoWon == main{
            
            score[0] += 1
            //zbog tajmera koji se poziva na svakih 5 sekundi koji povecava za 1 brzinu lopte
            //kada novi poen krene brzina lopte je difoltna
            determineBallSpeed()
            ball.physicsBody?.applyImpulse(CGVector(dx: speedOfBall, dy: speedOfBall))
            
        }else if playerWhoWon == enemy{
            score[1] += 1
            determineBallSpeed()
            ball.physicsBody?.applyImpulse(CGVector(dx: -speedOfBall, dy: -speedOfBall))
        }
        
        toplbl.text = "\(score[1])"
        bottomlbl.text = "\(score[0])"
        
        if modeTo == "11" {
        
            if score[0] == 11 {
                UserDefaults.standard.set("Player one", forKey: "winner")
                UserDefaults.standard.set(mode, forKey: "mode")
                timer.invalidate()
                if let scene = EndScene(fileNamed: "EndScene") {
                    // Set the scale mode to scale to fit the window
                    scene.scaleMode = .aspectFill
                    scene.size = view!.bounds.size
                    // Present the scene
                    view!.presentScene(scene, transition : SKTransition.doorsOpenVertical(withDuration: TimeInterval(0.9)))
                }
   
            }else if score[1] == 11 {
                UserDefaults.standard.set("Player two", forKey: "winner")
                UserDefaults.standard.set(mode, forKey: "mode")
                timer.invalidate()
                if let scene = EndScene(fileNamed: "EndScene") {
                    // Set the scale mode to scale to fit the window
                    scene.scaleMode = .aspectFill
                    scene.size = view!.bounds.size
                    // Present the scene
                    view!.presentScene(scene, transition : SKTransition.doorsOpenVertical(withDuration: TimeInterval(0.9)))
                }
                
            }
        }else{
        
            if score[0] == 21 {
                UserDefaults.standard.set("Player one", forKey: "winner")
                UserDefaults.standard.set(mode, forKey: "mode")
                timer.invalidate()
                if let scene = EndScene(fileNamed: "EndScene") {
                    // Set the scale mode to scale to fit the window
                    scene.scaleMode = .aspectFill
                     scene.size = view!.bounds.size
                    // Present the scene
                    view!.presentScene(scene, transition : SKTransition.doorsOpenVertical(withDuration: TimeInterval(0.9)))
                }
                
      
            }else if score[1] == 21 {
                UserDefaults.standard.set("Player two", forKey: "winner")
                UserDefaults.standard.set(mode, forKey: "mode")
                timer.invalidate()
                if let scene = EndScene(fileNamed: "EndScene") {
                    // Set the scale mode to scale to fit the window
                    scene.scaleMode = .aspectFill
                    scene.size = view!.bounds.size
                    // Present the scene
                    view!.presentScene(scene, transition : SKTransition.doorsOpenVertical(withDuration: TimeInterval(0.9)))
                }
                
            }
        }
        
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
    
    func reSize(device: String){
        
        //nema definisanog defoult-a
        
         if device == "iPhone 7" {
            
            enemy.setScale(0.6)
            main.setScale(0.6)
            
        } else if device == "iPhone 7 Plus" {
            enemy.setScale(0.8)
            main.setScale(0.8)
           
        } else if device == "iPhone SE" {
            enemy.setScale(0.57)
            main.setScale(0.57)
         }else if device == "iPhone X" {
            enemy.setScale(0.63)
            main.setScale(0.63)
         }else if device == "iPad 9,7" {
            enemy.setScale(0.8)
            main.setScale(0.8)
            
        }

    }
    
   override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
   
        for touch in touches {
        
            let location = touch.location(in: self)
            
            if mode == "Multiplayer"{
                if location.y > 0 {
                    enemy.run(SKAction.moveTo(x: location.x, duration: 0.1))
                }
                if location.y < 0 {
                    main.run(SKAction.moveTo(x: location.x, duration: 0.1))
                }
            }
            else {
                main.run(SKAction.moveTo(x: location.x, duration: 0.1))
            }
            
    
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            
            let location = touch.location(in: self)
            
            if mode == "Multiplayer"{
                if location.y > 0 {
                    enemy.run(SKAction.moveTo(x: location.x, duration: 0.1))
                }
                if location.y < 0 {
                    main.run(SKAction.moveTo(x: location.x, duration: 0.1))
                }
            }
            else {
                main.run(SKAction.moveTo(x: location.x, duration: 0.1))
            }
          
        }

    }

    override func update(_ currentTime: TimeInterval) {
        
        ballLocation = ball.position.x
        velocity = ball.physicsBody?.velocity ?? CGVector(dx: 0, dy: 0)

        switch mode {
        case "Easy":
            enemy.run(SKAction.moveTo(x: ball.position.x
                , duration: 1.0))
            break
        case "Medium":
            enemy.run(SKAction.moveTo(x: ball.position.x
                , duration: 0.7))
            break
        case "Hard":
            enemy.run(SKAction.moveTo(x: ball.position.x
                , duration: 0.45))
            break
        case "Impossible":
           
                //sasvim nemoguce pobijediti protivnika
            enemy.run(SKAction.moveTo(x: ball.position.x, duration: 0.05))
            break
        case "Multiplayer":
            
            break
       
        default:
            break
        }
 

        if ball.position.y <= main.position.y - (ball.size.height * 2) / 3 {
            addScore(playerWhoWon: enemy)
            
        }
        else if ball.position.y >= enemy.position.y + (ball.size.height * 2) / 3 {
            addScore(playerWhoWon: main)
            
        }

        
    }
 
}
