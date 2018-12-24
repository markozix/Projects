//
//  ViewController.swift
//  ReserveYourSpot
//
//  Created by Marko Vukicevic on 6/8/18.
//  Copyright © 2018 S&M. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase



class ViewController: UIViewController {

    @IBOutlet weak var emailTf: UITextField!
    @IBOutlet weak var passwordTf: UITextField!
    @IBOutlet weak var chooseSegment: UISegmentedControl!
    @IBOutlet weak var signUpbtn: UIButton!
    @IBOutlet weak var logInbtn: UIButton!
    @IBOutlet weak var lbBottomText: UILabel!
    
    
    var ref : DatabaseReference!
    var handle : DatabaseHandle?
    var logIn = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //referenca baze
        ref = Database.database().reference()
       
    }
    
//NE DIRATI BROJAC DA SE NE BI SJEBALA BAZA
   var br = 0
//OZBILJAN SAM NE DIRAJ TRAZI DRUGI NACIN

    
    func displayAlert(title: String, message: String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
        
    }
    

    @IBAction func logIn(_ sender: UIButton){
        
        var s = self.emailTf.text!
        s += " Guest"
        
        self.ref.child("Users").child("Guest").observe(.value) { (snapshot) in
            var r = snapshot.childrenCount
            
            if let child = snapshot.value as? [String : Any]{
       
               var s1 = String(child.values.debugDescription)
                
                if s1.contains(s){
                    //za test rucno dodati u bazu autentikacije nalog i nece proci
                    // marko@gmail.com (14.10.2018)
                    print("Radi")
                    self.performSegue(withIdentifier: "goToGuest", sender: self)
                }else{
                    print("ne radi")
                }
            }
        }
    }
    
    
    @IBAction func logIn2(_ sender: UIButton){
        var s = self.emailTf.text!
        s += " Owner"
        
        self.ref.child("Users").child("Owner").observe(.value) { (snapshot) in
            var r = snapshot.childrenCount
            
            if let child = snapshot.value as? [String : Any]{
                
                
                var s1 = String(child.values.debugDescription)
                
                if s1.contains(s){
                    //za test rucno dodati u bazu autentikacije nalog i nece proci
                    // marko@gmail.com za test (14.10.2018)
                    print("Radi")
                    self.performSegue(withIdentifier: "goToOwner", sender: self)
                }else{
                    print("ne radi")
                }
            }
        }
    }
    
  
    
    @IBAction func logInPressed(_ sender: Any) {
        
        if emailTf.text == "" || passwordTf.text == "" {
            displayAlert(title: "Missing information", message: "You must provide email and password!")
            
        }else{
            if let email = emailTf.text{
                if let password = passwordTf.text {
                    
                    if(logIn){
                        //log in
                        // kad se stisne login treba da se dalje implementiraju prmjene
                        
                        Auth.auth().signIn(withEmail: email, password: password){(user,error) in
                            
                            if let error = error {
                                self.displayAlert(title: "Error", message: error.localizedDescription)
                                
                            }else if let user = user {
                                //print("Log in uspjesan")
                                
                                if self.chooseSegment.selectedSegmentIndex.description == "0"{
                                
                                    //radimo gosta njegov view
                                    
                                    //provjeravamo da li gosta ima stvarno u listi u

                                self.logIn(self.logInbtn)
                                    
                            }else{
                                    //login za vlasnika u odnosu na izabrano polje
                                    self.logIn2(self.logInbtn)
                            }
                                
                        }
                            
                    }
                        
                }else{
                        
                //sign up
                //po registarciji treba da se implementira manje vise isto kao i poslije login
                        
                    Auth.auth().createUser(withEmail: email, password: password){(user,error) in
                            
                    if let error = error {
                        self.displayAlert(title: "Error", message: error.localizedDescription)
                                
                    }else if let user = user {
                                
                        if self.chooseSegment.selectedSegmentIndex.description == "0"{
                            //pisemo u bazu ko se logovao
                            
                            var s = self.emailTf.text!
                            s += " Guest"
                            
                            //treba brojac uraditi
                            //ne diraj radi!!!!
                            self.ref.child("Users").child("Guest").observeSingleEvent(of: .value, with: { (snapshot) in
                                self.br = Int(snapshot.childrenCount)
                                self.ref.child("Users").child("Guest").child("Guest " + "\(self.br)").setValue(s)
                            })
                            
                            //gost
                                    
                            self.logIn(self.logInbtn)
                            
                        }else{
                            //login za vlasnika u odnosu na izabrano polje
                            
                            var s = self.emailTf.text!
                            s += " Owner"
                            
                            //ne diraj radi!!!!
                            self.ref.child("Users").child("Owner").observeSingleEvent(of: .value, with: { (snapshot) in
                                self.br = Int(snapshot.childrenCount)
                                self.ref.child("Users").child("Owner").child("Owner " + "\(self.br)").setValue(s)
                                // proba za bolji upis u bazu podataka
                             //   self.ref.child("Users").child("Owner").child("Owner " + "\(self.br)").setValue(["email" : s,
                             //       "type" : "Owner"])
                            })
                            
                            
                            self.logIn2(self.logInbtn)
                        }
                    }
                }
            }
        }
    }
}
}
   
    //funkcija za sign up i promjene za log in dugme(tekst koji se prikazuje)
        @IBAction func singUpPressed(_ sender: Any) {
        
        if logIn{
            logInbtn.setTitle("Sign up", for: .normal)
            signUpbtn.setTitle("Log in", for: .normal)
            logIn = false
        } else {
            logInbtn.setTitle("Log in", for: .normal)
            signUpbtn.setTitle("Sign up", for: .normal)
            logIn = true
        }
            
            
    }
   
    
 
    
        
}
    




