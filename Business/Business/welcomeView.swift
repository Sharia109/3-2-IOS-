//
//  welcomeView.swift
//  Business
//
//  Created by kuetcse on 4/12/19.
//  Copyright © 2019 kuetcse. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class welcomeView: UIViewController {
    
    
    @IBOutlet weak var idLabel: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
    
     
    }
    

    @IBAction func logout(_ sender: Any) {
        
        try! Auth.auth().signOut()
        self.dismiss(animated: true, completion: nil)
    }
}
