//
//  BigShip.swift
//  NaprednaGrupaZadatak
//
//  Created by Marko Vukicevic on 12/11/19.
//  Copyright © 2019 Markan. All rights reserved.
//

import Foundation
class BigShip : Ship{
    override init() {
        super.init()
        self.health = 500
        self.speed = 150
        self.damage = 100
        self.type = "bs"
    }
    
    
    
}
