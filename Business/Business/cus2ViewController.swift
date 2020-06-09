//
//  cus2ViewController.swift
//  Business
//
//  Created by kuetcse on 5/12/19.
//  Copyright © 2019 kuetcse. All rights reserved.
//


import UIKit
import FirebaseDatabase
class cus2ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    var ref: DatabaseReference!
      var frelist = [freModel]()
     var p2: String = ""
    @IBOutlet weak var tblc: UITableView!

    
   
         
         func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let fretis = frelist[indexPath.row]
         let alert = UIAlertController(title:"Confirm", message: "selection",preferredStyle:.alert)
         alert.addAction(UIAlertAction(title: "select", style: .default, handler:{action in
         
         let id = fretis.id
         
         self.confm(id: id!)
         
         }))
      
         
         self.present(alert, animated:true, completion: nil)
         
         }
         
     
        
        
        
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return frelist.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell3" , for: indexPath) as! cusTableViewController
            let frre: freModel
            frre = frelist[indexPath.row]
           // testing.text = frre.quali
            cell.quaal.text = frre.quali
            cell.exppr.text = frre.exper
            
            return cell
        }


        
        override func viewDidLoad() {
            super.viewDidLoad()

            ref = Database.database().reference()
            
           ref.child("freelancer").queryOrdered(byChild: "seid").queryEqual(toValue: uid)
                .observe(.value, with: { (snapshot: DataSnapshot) in
                    for frelis in snapshot.children.allObjects as![DataSnapshot]{
                        let freli = frelis.value as? [String : AnyObject]
                        let idd = freli?["id"]
                        let seidd = freli?["seid"]
                        let amouu = freli?["amou"]
                        let experr = freli?["exper"]
                        let qualii = freli?["quali"]
    let free = freModel(id: idd as? String, seid: seidd as? String, quali: qualii as? String,amou: amouu as? String,exper: experr as? String)
                        self.frelist.append(free)
                    }
                    self.tblc.reloadData()
            }
            )

            
        }
        
        func confm(id: String){
                   ref.child("customer").child(uid).child("seid").setValue(id)
            
        }
       

    }
