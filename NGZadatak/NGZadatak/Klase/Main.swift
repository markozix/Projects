//
//  Main.swift
//  NaprednaGrupaZadatak
//
//  Created by Marko Vukicevic on 12/10/19.
//  Copyright © 2019 Markan. All rights reserved.
//

import Foundation
import UIKit
class Main : UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //generisanje flote brodova
        
        let commanderBlue = CommandShip()
        //od 1 do 10 brodova u floti
        let randBlueCapacity = Int.random(in: 1...10)
        var cnt = 0
        
        while cnt <= randBlueCapacity {
            let randBlueType = Int.random(in: 0...3)
            switch randBlueType {
            case 0:
                commanderBlue.fleet.append(SmallShip())
                break
            case 1:
                commanderBlue.fleet.append(BigShip())
                break
            case 2:
                commanderBlue.fleet.append(SmallCargo())
                break
            case 3:
                commanderBlue.fleet.append(BigCargo())
                break
            default:
                break
            }
            
            cnt += 1
            
        }

        let commanderRed = CommandShip()
        let randRedCapacity = Int.random(in: 1...10)
        var cnt2 = 0
        
        while cnt2 <= randRedCapacity {
            let randRedType = Int.random(in: 0...3)
            switch randRedType {
            case 0:
                commanderRed.fleet.append(SmallShip())
                break
            case 1:
                commanderRed.fleet.append(BigShip())
                break
            case 2:
                commanderRed.fleet.append(SmallCargo())
                break
            case 3:
                commanderRed.fleet.append(BigCargo())
                break
            default:
                break
            }
            
            cnt2 += 1
            
        }
        //fukncija za pogodak
        
        func hitChance() -> Bool {
            let randHitChance = Int.random(in: 0...50)
            if randHitChance < 25 {
                return false
            }else{
                return true
            }
        }
        
        //mehanika za borbu
        var br = 0
        
        if cnt > cnt2 {
            br = cnt2
        }else{
            br = cnt
        }
        
        func getShip(commShip: CommandShip, fleetLeft : Int) -> Ship{
            let rand = Int.random(in: 0...fleetLeft)
            //print("\(rand) ovo je rand")
            return commShip.fleet[rand]
            
        }
        
        while(commanderBlue.fleet.count != 0 && commanderRed.fleet.count != 0){
        
//            print(commanderBlue.fleet.count)
//            print(commanderRed.fleet.count)
            
            let r1 = getShip(commShip: commanderRed, fleetLeft: commanderRed.fleet.count - 1)
         
            let r2 = getShip(commShip: commanderBlue, fleetLeft: commanderBlue.fleet.count - 1)

            while(r1.health! > 0 && r2.health! > 0){
                
                if(hitChance()){
                    r2.attack(ship: r1)
                    //print("r2 napao")
                }else{
                    //print("Promasio")
                }
                
                if(hitChance()){
                    r1.attack(ship: r2)
                    //print("r1 napao")
                }else{
                    //print("Promasio i 2")
                }
            }
//            print("ship 1 \(r1.health)")
//            print("ship 2 \(r2.health)")

            if(r1.health! <= 0){
                let index = commanderRed.fleet.firstIndex(where: {$0 === r1})
                commanderRed.fleet.remove(at: index!)
//                //brod koji ostaje u listi ima onliko helti koliko mu je ostalo u brobi prije
                //nepotreban dio jer ne incijalizujem niz ponovo kao ni objekte u njemu, tako da bi trebalo da modifikacije na objektima bude za stalno tj da se oni ne vracaju na pocetne vrijednosti nakon sto prezive borbu
//                let index2 = commanderBlue.fleet.firstIndex(where: {$0 === r2})
//                commanderBlue.fleet[index2!].health = r2.health
            }
            if(r2.health! <= 0){
                let index = commanderBlue.fleet.firstIndex(where: {$0 === r2})
                commanderBlue.fleet.remove(at: index!)
                
//                let index2 = commanderRed.fleet.firstIndex(where: {$0 === r1})
//                print("\(commanderRed.fleet[index2!].health)")
//                print("ovo je r2 vrijednost \(r1.health!)")
//                commanderRed.fleet[index2!].health! = r1.health!
//                print("\(commanderRed.fleet[index2!].health) ovo je poslije")
                
            }

        }
        
        print("Kraj igre")
        
    }

}
    
    

