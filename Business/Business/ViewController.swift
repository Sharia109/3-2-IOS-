//
//  ViewController.swift
//  Business
//
//  Created by kuetcse on 4/12/19.
//  Copyright © 2019 kuetcse. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var emailTF: UITextField!
    
    
    
    @IBOutlet weak var passwordTF: UITextField!
    
    var uid: String = ""
    var ref : DatabaseReference!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.ref = Database.database().reference()
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func registrationAction(_ sender: Any) {
        
        
        if emailTF != nil && passwordTF != nil {
        
                   Auth.auth().createUser(withEmail: emailTF.text!, password: passwordTF.text!){ (result, error) in
                       if error != nil {
                           print("THERE WAS AN ERROR IN SIGNUP")
                       }
                       else {
                     
                        let email = self.emailTF.text!
                        let password = self.passwordTF.text!
                        
                        
                        
                       
                        self.uid = (result?.user.uid)!
                        
                        self.ref.child("users").child(self.uid).setValue(["email" : email, "password": password])
                        
                        self.performSegue(withIdentifier: "welcomeSegue", sender: self)
                    
                        
                        }

            }
        }
        
        
        
    }
    
    
    
    
    
    
    
    @IBAction func loginAction(_ sender: Any) {
        
        
        if emailTF != nil && passwordTF != nil {
            
            
            Auth.auth().signIn(withEmail: emailTF.text!, password: passwordTF.text!){ (result, error) in
                if error != nil {
                    print("THERE WAS AN ERROR IN LOGIN")
                }
                else {
                 
                    self.uid = (result?.user.uid)!
                    self.performSegue(withIdentifier: "welcomeSegue", sender: self)
                
                }
            }
        }
    }
    

}

