//
//  GameViewController.swift
//  PongPossible
//
//  Created by Marko Vukicevic on 9/27/18.
//  Copyright © 2018 Markan. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import AVFoundation


class GameViewController: UIViewController {

    var bgMusic : AVAudioPlayer?
    var hitMusic : AVAudioPlayer?
    let ncObserver = NotificationCenter.default
    var music : String = UserDefaults.standard.string(forKey: "music") ?? "true"
    let path = Bundle.main.path(forResource: "music.mp3", ofType:nil)!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //zvuk udara lotice
        //mora mnogo krace da bi radilo kada se sudari sa zidom i reketom
        //ili izbaciti zvuk udara od zid
        
        //muzika!!!!!!!!!!!!
       
        let url = URL(fileURLWithPath: path)
        
        
        do {
            bgMusic = try AVAudioPlayer(contentsOf: url)
            bgMusic?.numberOfLoops = -1
            if(music == "true"){
          
                bgMusic?.play()
            }
        } catch {
            // couldn't load file :(
        }
        
        ncObserver.addObserver(self, selector: #selector(self.stopMusic), name: Notification.Name("StopMusic"), object: nil)
        ncObserver.addObserver(self, selector: #selector(self.playMusic), name: Notification.Name("PlayMusic"), object: nil)
        
        //muzika!!!!!!!!!!!
        
        let path1 = Bundle.main.path(forResource: "hit4.mp3", ofType:nil)!
        let url1 = URL(fileURLWithPath: path1)
        
        
        do {
            hitMusic = try AVAudioPlayer(contentsOf: url1)
            hitMusic?.numberOfLoops = 0
            
            hitMusic?.stop()
        } catch {
            // couldn't load file :(
        }
        ncObserver.addObserver(self, selector: #selector(self.stopHit), name: Notification.Name("StopHit"), object: nil)
        ncObserver.addObserver(self, selector: #selector(self.playHit), name: Notification.Name("PlayHit"), object: nil)
        
        
        //ovo je pocetak marko dragi!!!!
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = MMClass(fileNamed: "MMScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                scene.size = view.bounds.size
                // Present the scene
                view.presentScene(scene)
            
                
            }

            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }

    
    @objc func stopMusic(){
        bgMusic?.stop()
    }
    @objc func playMusic(){
        bgMusic?.play()
    }
    
    @objc func stopHit(){
        hitMusic?.stop()
    }
    @objc func playHit(){
        hitMusic?.play()
    }

    
    @objc func stopHitt(){
        hitMusic?.stop()
    }
    @objc func playHitt(){
        hitMusic?.play()
    }
    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
