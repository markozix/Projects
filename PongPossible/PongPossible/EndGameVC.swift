//
//  EndGameVC.swift
//  PongPossible
//
//  Created by Marko Vukicevic on 9/27/18.
//  Copyright © 2018 Markan. All rights reserved.
//

import Foundation
import UIKit


class EndGameVC: UIViewController {
    
    
    @IBAction func playAgain(_ sender: Any) {
        moveToStart()
    }
    
    func moveToStart(){
        performSegue(withIdentifier: "pocetak", sender: nil)
    }
    
    
}
