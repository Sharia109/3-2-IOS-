//
//  free2ViewController.swift
//  Business
//
//  Created by kuetcse on 5/12/19.
//  Copyright © 2019 kuetcse. All rights reserved.
//


import UIKit
import FirebaseDatabase
class free2ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
var ref: DatabaseReference!

    @IBOutlet weak var tabf: UITableView!
    var cuslist = [cusModel]()
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let custis = cuslist[indexPath.row]
        let alert = UIAlertController(title:"Confirm", message: "selection",preferredStyle:.alert)
        alert.addAction(UIAlertAction(title: "select", style: .default, handler:{action in
            
            let idd = custis.id
          //  let namee = alert.textFields![0]
            
            self.selecupd(id: idd!)
            
        }))
      
        self.present(alert, animated:true, completion: nil)
        
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cuslist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell" , for: indexPath) as! freeTableViewController
        let cuss: cusModel
        cuss = cuslist[indexPath.row]
        
        cell.topi.text = cuss.topic
        cell.deadl.text = cuss.dead
        cell.amoun.text =  cuss.amou
        return cell
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
ref = Database.database().reference()
      
        ref.child("customer").observe(DataEventType.value, with: { (snapshot) in
            if snapshot.childrenCount>0{
                self.cuslist.removeAll()
                
                for cuslis in snapshot.children.allObjects as![DataSnapshot]{
                    let cusli = cuslis.value as? [String : AnyObject]
                    let idd = cusli?["id"]
                    let topicc = cusli?["topic"]
                    let deadd = cusli?["dead"]
                    let amouu = cusli?["amou"]
                    let seidd = cusli?["seid"]
                    let submm = cusli?["subm"]
                    let cusl = cusModel(id: idd as? String,seid: seidd as? String,topic: topicc as! String?,
                                        amou: amouu as! String?,dead: deadd as? String,subm: submm as? String)
                    self.cuslist.append(cusl)
                    
                }
               self.tabf.reloadData()
                
            }
            
        })
        
        
    }
    
    
    func selecupd(id: String){
     
        ref.child("freelancer").child(uid).child("seid").setValue(id)
    }

}
