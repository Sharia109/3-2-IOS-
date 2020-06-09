//
//  cus3ViewController.swift
//  Business
//
//  Created by kuetcse on 5/12/19.
//  Copyright © 2019 kuetcse. All rights reserved.
//

import UIKit
import FirebaseDatabase
  var p: String = ""
var yu: String = ""
class cus3ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
   var hj: Float = 0.0;
  
    var ref: DatabaseReference!
    
    @IBAction func nmu(_ sender: Any) {
                submit.text = p
        ref.child("freelancer").child(yu).child("amou").setValue(p)
        
    }
    
    
    @IBOutlet weak var tblc2: UITableView!
    
    
    
    
    @IBOutlet weak var submit: UILabel!
    var cuslist = [cusModel]()
        
        
         
         
         
         func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let custis = cuslist[indexPath.row]
         let alert = UIAlertController(title:"Confirm", message: "payment",preferredStyle:.alert)
         alert.addAction(UIAlertAction(title: "payment", style: .default, handler:{action in
      
         let sid = custis.seid
         let  amou = custis.amou
        // let subm = alert.textFields![0]
         
            self.pay(sid: sid!,amou: amou!)
         
         }))
        /* alert.addTextField(configurationHandler: {(textField) in
         textField.placeholder = "no"
         })*/
         
         self.present(alert, animated:true, completion: nil)
         
         }
         
         
         func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return cuslist.count
         }
         
         func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
         let cell = tableView.dequeueReusableCell(withIdentifier: "cell4" , for: indexPath) as! cus3TableViewController
         let cuss: cusModel
         cuss = cuslist[indexPath.row]
       
         cell.submis.text = cuss.subm
         
         
         return cell
         }
        
        
        
        override func viewDidLoad() {
            super.viewDidLoad()

            
             
             ref = Database.database().reference()
             
            
            ref.child("customer").queryOrdered(byChild: "id").queryEqual(toValue: uid)
                .observe(.value, with: { (snapshot: DataSnapshot) in
                    for cuslis in snapshot.children.allObjects as![DataSnapshot]{
                        let cusli = cuslis.value as? [String : AnyObject]
                        let idd = cusli?["id"]
                        let topicc = cusli?["topic"]
                        let deadd = cusli?["dead"]
                        let amouu = cusli?["amou"]
                        let seidd = cusli?["seid"]
                        let submm = cusli?["subm"]
    let cusl = cusModel(id: idd as? String,seid: seidd as? String,topic: topicc as! String?,
                        amou: amouu as? String,dead: deadd as? String,subm: submm as? String)
                        self.cuslist.append(cusl)
                        
                    }
                    self.tblc2.reloadData()
                    
            })
        

        }

        func pay(sid: String,amou: String){
            
            
            ref.child("freelancer").queryOrdered(byChild: "id").queryEqual(toValue: sid)
            .observe(.value, with: { (snapshot: DataSnapshot) in
                  for frelis in snapshot.children.allObjects as![DataSnapshot]{
                       let freli = frelis.value as? [String : AnyObject]
                    let amouu = freli?["amou"] as! String
                  
                     //   self.hj = Float(amouu!)!
                       // self.submit.text = String(self.hj)
                        //  let u = Double(truncating: amouu as! NSNumber)
                       // let u = Float(amouu!)!
                       // let u2 = Float(amou)!
                        //let u3 = u2+u
                       // self.hj = u3
                      //  self.submit.text = String(u)
                       // self.submit.text = String(self.hj)
                       // let k = String(self.hj)
                   //     let k = String(u3)
                //    self.ref.child("freelancer").child(sid).child("seid").setValue(id)
                        self.pay2(kl: amouu,fl: amou,mk: sid)
                    }
                
            }
            )
            
        }
      
        func pay2(kl: String,fl: String,mk: String){
       //   ref = Database.database().reference()
           let u = Float(kl)!
         //   let u = Float(truncating: kl as! NSNumber)
            let u2 = Float(fl)!
            let w = u2+u
       p = String(w)
         yu = mk
          // submit.text = p
    //ref.child("freelancer").child(mk).child("amou").setValue(w)
            
        }
    }
