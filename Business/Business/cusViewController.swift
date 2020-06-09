//
//  cusViewController.swift
//  Business
//
//  Created by kuetcse on 5/12/19.
//  Copyright © 2019 kuetcse. All rights reserved.
//

import UIKit
import FirebaseDatabase
class cusViewController: UIViewController {
  var ref: DatabaseReference!

    
    
    @IBOutlet weak var toPic: UITextField!
    
    @IBOutlet weak var deAd: UITextField!
    
    @IBOutlet weak var amOu: UITextField!
    @IBAction func doNec(_ sender: Any) {
         donec()
        
    }
    @IBAction func seLecc(_ sender: Any) {
    }
    
        override func viewDidLoad() {
            super.viewDidLoad()
             // show.text = uid
            ref = Database.database().reference()
     
        }
        override func viewDidAppear(_ animated: Bool) {
          
            
        }

        func donec(){
            let list = ["id":uid,"seid":"n",
                        "topic":toPic.text! as String,
                        "dead":deAd.text! as String,"amou":amOu.text! as String,"subm":"n"]
            ref.child("customer").child(uid).setValue(list)    }

    }

