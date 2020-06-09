//
//  TodoView.swift
//  Business
//
//  Created by kuetcse on 4/12/19.
//  Copyright © 2019 kuetcse. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth


class TodoView: UIViewController{

/*class TodoView: UIViewController , UITableViewDelegate, UITableViewDataSource{
 ----
   
    
    
    var userTD:String?
    
    var todos: [String] = []*/
    
    @IBOutlet var TodoTV: UITableView!}
    
  /*  struct Todo
    {
        var isChecked: Bool
        var todoName: String
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        TodoTV.delegate = self
        TodoTV.dataSource = self
        TodoTV.rowHeight = 80
        
        
       // loadTodos()


        // Do any additional setup after loading the view.
    }
    
    
    
    
    
    
  /*  func loadTodos()
    {
            let ref = Database.database().reference(withpath: "users").child(userId!).child("todos")
            
            ref.observeSingleEvent(of: .value) { (snapshot) in
            for child in snapshot.children.allObjects as! [DataSnapshot]{
            let todoName = child.key
            let todoRef = ref.child(todoName)
            todoRef.observeSingleEvent(of: .value, with: {(todoSnapshot) in
            let value = todoSnapShot.value as? NSDictionary
            let isChecked = value!["isChecked"] as? Bool
            self.todos.append(Todo(isChecked: isChecked!, todoName: todoName))
            self.TodoTV.reloadData()
            
    })
    }
    }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
    return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return todos.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "todocell", for: indexPath) as! TodoCell
        
           cell.todoLabel = todos[indexPath.row].todoName
        if todos[indexPath.row].isChecked {
            cell.checkmarkImage.image = UIImage(named: "checkmark.png")
        }
        else
        {
           cell.checkmarkImage.image = nil
        }
           
           return cell
       }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if todos[indexPath.row].isChecked
        {
            todos[indexPath.row].isChecked = false
            let ref = Database.database().reference(withPath: "users").child(userID!).child("todos"),child;(todos[indexPath.row].todoName)
            ref.updateChildValues(values: [])
        }
        else
        {
            
        }
    }*/

  

}
*/
