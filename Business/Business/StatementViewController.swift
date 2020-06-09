//
//  StatementViewController.swift
//  Business
//
//  Created by kuetcse on 8/12/19.
//  Copyright © 2019 kuetcse. All rights reserved.
//

import UIKit
import FirebaseDatabase

class StatementViewController: UIViewController {
    var ref: DatabaseReference!
    var ke: String = ""

    @IBOutlet weak var Income: UITextField!
    

    @IBOutlet weak var label: UILabel!
  
    @IBAction func buttonAdd(_ sender: UIButton) {
        addArt()    }
   override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            ref = Database.database().reference()
        }
        func addArt(){
               ke = Income.text!
               let key = ref.childByAutoId().key
               
               let artist = ["id" : key,
                             "Income": Income.text! as String
                               ]
               ref.child("artists").childByAutoId().setValue(artist)
               
            label.text = "Submitted !!!"
               
               
           }



    }
