//
//  Cargo.swift
//  NaprednaGrupaZadatak
//
//  Created by Marko Vukicevic on 12/11/19.
//  Copyright © 2019 Markan. All rights reserved.
//

import Foundation
class Cargo : Ship{
    
    var capacity: Int?
    var damage: Int?
    
    
    func attack(ship: Cargo) {
        if(ship.type == "bc"){
            ship.getDamage(dmg: (damage! - ship.shield!))
        }else{
            ship.getDamage(dmg: damage!)
        }
      
        
    }
    
    func attack(ship: BattleShip) {
        if(ship.type == "com"){
            ship.getDamage(dmg: (damage! - ship.shield!))
        }else{
            ship.getDamage(dmg: damage!)
        }
      
        
    }
    
    
}
