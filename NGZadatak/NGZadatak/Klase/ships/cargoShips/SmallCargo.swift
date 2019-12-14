//
//  SmallCargo.swift
//  NaprednaGrupaZadatak
//
//  Created by Marko Vukicevic on 12/11/19.
//  Copyright © 2019 Markan. All rights reserved.
//

import Foundation
class SmallCargo: Ship{
    
    override init() {
        super.init()
        self.health = 100
        self.capacity = 1000
        self.type = "sc"
        self.damage = 5
    }
    
}
