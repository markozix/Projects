//
//  SmallShip.swift
//  NaprednaGrupaZadatak
//
//  Created by Marko Vukicevic on 12/11/19.
//  Copyright © 2019 Markan. All rights reserved.
//

import Foundation
class SmallShip: Ship {
    override init() {
        super.init()
        self.health = 300
        self.speed = 100
        self.damage = 50
        self.type = "sh"
    }
}
