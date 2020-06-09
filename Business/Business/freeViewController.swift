//
//  freeViewController.swift
//  Business
//
//  Created by kuetcse on 5/12/19.
//  Copyright © 2019 kuetcse. All rights reserved.
import UIKit
import FirebaseDatabase
class freeViewController: UIViewController {
   var ref: DatabaseReference!

    
    
    @IBOutlet weak var quaLi: UITextField!
    
    @IBOutlet weak var exPer: UITextField!
    
    
    @IBAction func doNef(_ sender: Any) {  donef()    }
    
    
    @IBAction func seLecf(_ sender: Any) {
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       ref = Database.database().reference()
    }
    override func viewDidAppear(_ animated: Bool) {
       // show2.text! = uid
        
    }
    func donef(){
        
        
        let list = ["id":uid,"seid":"n",
                    "quali":quaLi.text! as String,
                    "exper":exPer.text! as String,"amou":"0"]
         ref.child("freelancer").child(uid).setValue(list)    }


}
