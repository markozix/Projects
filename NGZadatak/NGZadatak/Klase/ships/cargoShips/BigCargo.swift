//
//  BigCargo.swift
//  NaprednaGrupaZadatak
//
//  Created by Marko Vukicevic on 12/11/19.
//  Copyright © 2019 Markan. All rights reserved.
//

import Foundation
class BigCargo : Ship{
    
    override init() {
        super.init()
        self.shield = 10
        self.health = 200
        self.capacity = 5000
        self.type = "bc"
        self.damage = 20
    }
    
}
