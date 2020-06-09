//
//  vViewController.swift
//  Business
//
//  Created by kuetcse on 5/12/19.
//  Copyright © 2019 kuetcse. All rights reserved.
//

import UIKit
import FirebaseDatabase
 var uid: String = ""
var pp: Float = 0.0;

class vViewController: UIViewController {
var ref: DatabaseReference!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var firstShow: UILabel!
    
    @IBOutlet weak var firstInput: UITextField!
    @IBAction func creatbt(_ sender: Any) {
             creat()
    }
    
    @IBAction func creat2bt(_ sender: Any) {
        creat2()
        
    }
    
    @IBAction func cusbt(_ sender: Any) {
         custo()
        
    }
    
    @IBAction func frebt(_ sender: Any) {
            freel()
    }
    
    
    
    
  /*  let urlkey = "https://images.pexels.com/photos/67636/rose-blue-flower-rose-blooms-67636.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"*/
let urlkey = "https://opportunitygroup.ca/wp-content/uploads/2017/06/Business.jpg"
        override func viewDidLoad() {
            super.viewDidLoad()
            if let url = URL(string: urlkey){
                do{
                    let data = try Data(contentsOf: url)
                    self.imageView.image = UIImage(data: data)
                }catch let err{
                    print("Error:\(err.localizedDescription)")
                }
            }
             //  uid = Uiid
                    // firstShow.text =  uid
           // firstShow.text = "ENTER EMAIL"
           ref = Database.database().reference()
        }
        func creat(){
            uid = firstInput.text!
           // print(uid)
         // uid = Uiid
            let list = ["id":uid,"seid":"n","topic":"n","dead":"n","amou":"0.0","subm":"n"]
            ref.child("customer").child(uid).setValue(list)
            print(uid)
            
        }
     
        func creat2(){
            //uid = Uiid
            firstShow.text =  uid
            uid = firstInput.text!
            let list = ["id":uid,"seid":"n","quali":"n","exper":"n","amou":"0.0"]
            ref.child("freelancer").child(uid).setValue(list)
            
        }
        
        func custo(){
            //uid = Uiid
            uid = firstInput.text!
           performSegue(withIdentifier: "cus", sender: self)
        }
        func freel(){
            //uid = Uiid
        uid = firstInput.text!
           performSegue(withIdentifier: "fre", sender: self)
        }

        
    }
