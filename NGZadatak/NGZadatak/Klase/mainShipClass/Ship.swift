//
//  Ship.swift
//  NaprednaGrupaZadatak
//
//  Created by Marko Vukicevic on 12/10/19.
//  Copyright © 2019 Markan. All rights reserved.
//

import Foundation

class Ship {
    var health : Int?
    var speed : Int?
    var type : String?
    var shield : Int?
    var damage: Int?
    var capacity: Int?
    
    func attack(ship: Ship) {
        if(ship.type == "com" || ship.type == "bc"){
            ship.getDamage(dmg: (damage! - ship.shield!))
        }else{
            ship.getDamage(dmg: damage!)
        }
      
        
    }
    
    func getDamage(dmg: Int){
        //printovi za provjeru sa koliko pocinju brodovi helti
        print("\(health!) helti prije")
        health! -= dmg
        print("\(health!) helti poslije")
        if(health! <= 0){
            print("Ship destroyed!")
        }
    }
    
}


