//
//  CommandShip.swift
//  NaprednaGrupaZadatak
//
//  Created by Marko Vukicevic on 12/11/19.
//  Copyright © 2019 Markan. All rights reserved.
//

import Foundation
class CommandShip: Ship{
    
    var fleet = [Ship]()
   
    
    
    override init() {
        super.init()
        self.shield = 20
        self.health = 1000
        self.speed = 300
        self.damage = 150
        self.type = "com"
    }
}
