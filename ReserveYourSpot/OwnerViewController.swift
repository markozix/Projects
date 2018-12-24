//
//  OwnerViewController.swift
//  ReserveYourSpot
//
//  Created by Marko Vukicevic on 6/12/18.
//  Copyright © 2018 S&M. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class OwnerViewController: UIViewController {

    @IBOutlet weak var logOutbtn: UIToolbar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func logOutPressed(_ sender: Any) {
        
        
        
        do{
            try Auth.auth().signOut()
        }catch let error {
            print(error)
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let signInVC = storyboard.instantiateViewController(withIdentifier: "ViewController")
        
        self.present(signInVC, animated: true, completion: nil)
        
        
    }
    

}
