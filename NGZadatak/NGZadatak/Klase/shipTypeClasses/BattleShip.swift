//
//  BattleShip.swift
//  NaprednaGrupaZadatak
//
//  Created by Marko Vukicevic on 12/10/19.
//  Copyright © 2019 Markan. All rights reserved.
//

import Foundation
class BattleShip : Ship {

    var damage : Int?
    
//    init(dmg: Int) {
//        damage = dmg
//    }
    
    func attack(ship: BattleShip) {
        if(ship.type == "com"){
            ship.getDamage(dmg: (damage! - ship.shield!))
        }else{
            ship.getDamage(dmg: damage!)
        }
      
        
    }
    
    func attack(ship: Cargo) {
        if(ship.type == "bc"){
            ship.getDamage(dmg: (damage! - ship.shield!))
        }else{
            ship.getDamage(dmg: damage!)
        }
      
        
    }
    
    
    
}
