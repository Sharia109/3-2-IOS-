//
//  free3ViewController.swift
//  Business
//
//  Created by kuetcse on 5/12/19.
//  Copyright © 2019 kuetcse. All rights reserved.
//

import UIKit
import FirebaseDatabase
class free3ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    var ref: DatabaseReference!

    @IBOutlet weak var tblf3: UITableView!
    var p2: String = ""
    var cuslist = [cusModel]()
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let custis = cuslist[indexPath.row]
        let alert = UIAlertController(title:"Enter your", message: "assignment",preferredStyle:.alert)
        alert.addAction(UIAlertAction(title: "submit", style: .default, handler:{action in
            
            let id = custis.id
            let  amou = custis.amou
            let subm = alert.textFields![0]
            
            self.confm(id: id!,subm: subm,amou: amou!)
            
        }))
        alert.addTextField(configurationHandler: {(textField) in
            textField.placeholder = "no"
        })

        self.present(alert, animated:true, completion: nil)
        
    }
 
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cuslist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2" , for: indexPath) as! free3TableViewController
        let cuss: cusModel
        cuss = cuslist[indexPath.row]
        
        cell.topf3.text = cuss.topic
        cell.deadf3.text = cuss.dead
     
        return cell
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

          ref = Database.database().reference()
        
        ref.child("customer").queryOrdered(byChild: "seid").queryEqual(toValue: uid)
        .observe(.value, with: { (snapshot: DataSnapshot) in
            for cuslis in snapshot.children.allObjects as![DataSnapshot]{
                let cusli = cuslis.value as? [String : AnyObject]
                let idd = cusli?["id"]
                let topicc = cusli?["topic"]
                let deadd = cusli?["dead"]
                let amouu = cusli?["amou"]
                let seidd = cusli?["seid"]
                let submm = cusli?["subm"]
let cusl = cusModel(id: idd as? String,seid: seidd as? String,topic: topicc as? String,
                amou: amouu as? String,dead: deadd as? String,subm: submm as? String)
                self.cuslist.append(cusl)
                
            }
            self.tblf3.reloadData()
            
        }
        
    )
            
            }
    
    
    func confm(id: String,subm: UITextField,amou: String){
        p2 = subm.text!
        ref.child("customer").child(id).child("subm").setValue(p2)
      //  ref.child("freelancer").child(uid).child("subm").setValue(p2)
        
    }
 
  

}
