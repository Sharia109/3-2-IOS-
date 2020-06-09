//
//  TodoView.swift
//  
//
//  Created by kuet on 8/12/19.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

struct Todo{
    var isChecked: Bool
    var todoName: String
}



class TodoView: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        countTodos = todos.count
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tcell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath) as! TodoCell
        
        tcell.todoLabel.text = todos[indexPath.row].todoName
        
        if todos[indexPath.row].isChecked{
            
            tcell.checkmarkImage.image = UIImage(named: "checkmark.jpg")
           
        }
        else{
            tcell.checkmarkImage.image = nil
           
        }
        
        return tcell
    }
    
    
    
    @IBOutlet weak var TodoTableView: UITableView!
    
    var userID = Auth.auth().currentUser?.uid
    
     var todos: [Todo] = []
     var countTodos:Int = 0
     var countComplete:Int = 0
    
    

    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            let ref = Database.database().reference(withPath: "users").child(userID!).child("todos").child(todos[indexPath.row].todoName)
            
           

            if todos[indexPath.row].isChecked{
                todos[indexPath.row].isChecked = false
                
                countComplete -= 1
                ref.updateChildValues(["isChecked": false])
            }
            else{
                todos[indexPath.row].isChecked = true
                countComplete += 1
                ref.updateChildValues(["isChecked": true])
            }
            
            TodoTableView.reloadData()
        }

    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
           
           if editingStyle == .delete{
               let ref = Database.database().reference(withPath: "users").child(userID!).child("todos").child(todos[indexPath.row].todoName)
               
               ref.removeValue()
               todos.remove(at: indexPath.row)
               TodoTableView.reloadData()
           }
       }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TodoTableView.delegate = self
               TodoTableView.dataSource = self
               TodoTableView.rowHeight = 80
               
               
               loadTodos()

        
    }
    
    
    
    @IBAction func addTodo(_ sender: Any) {
        
        let todoAlert = UIAlertController(title: "New Activity", message: "Add your activity", preferredStyle: .alert)
                
        todoAlert.addTextField()
        
        let addTodoAction = UIAlertAction(title: "Add", style: .default){ (action) in
            let todoText = todoAlert.textFields![0].text
            self.todos.append(Todo(isChecked: false, todoName: todoText!))
            let ref = Database.database().reference(withPath: "users").child(self.userID!).child("todos")
            ref.child(todoText!).setValue(["isChecked": false])
            self.TodoTableView.reloadData()
    }
    

   
    
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
        
        todoAlert.addAction(addTodoAction)
        todoAlert.addAction(cancelAction)
        
        present(todoAlert, animated: true, completion: nil)
    }
    
    func loadTodos(){
        let ref = Database.database().reference(withPath: "users").child(userID!).child("todos")
        
        countComplete = 0
        
        ref.observeSingleEvent(of: .value){ (snapshot) in
            for child in snapshot.children.allObjects as! [DataSnapshot]{
                let todoName = child.key
                let todoRef = ref.child(todoName)
                
                todoRef.observeSingleEvent(of: .value, with: { (todoSnapshot) in
                    let value = todoSnapshot.value as? NSDictionary
                    let isChecked = value!["isChecked"] as? Bool
                    if isChecked == true{
                        
                        self.countComplete += 1
                    }
                    self.todos.append(Todo(isChecked: isChecked!, todoName: todoName))
                    self.TodoTableView.reloadData()
                })
            }
        }
            
    }
    
}
