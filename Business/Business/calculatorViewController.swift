//
//  calculatorViewController.swift
//  Business
//
//  Created by kuetcse on 5/12/19.
//  Copyright © 2019 kuetcse. All rights reserved.
//

import UIKit

class calculatorViewController: UIViewController {

    
    @IBOutlet weak var result: UILabel!
    
    var x:Double = 0
    var y:Double = 0
    var s:String = ""
    var p = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func press0(_ sender: UIButton) {
        if(p==true){
                 result.text = String(sender.tag)
                 x = Double(result.text!)!
                 p = false
             }
             else{
                 result.text = result.text! + String(sender.tag)
                 x = Double(result.text!)!
                 
             }
    }
    
    
    @IBAction func press1(_ sender: UIButton) {
        if(p==true){
                 result.text = String(sender.tag)
                 x = Double(result.text!)!
                 p = false
             }
             else{
                 result.text = result.text! + String(sender.tag)
                 x = Double(result.text!)!
                 
             }
    }
    
    
    @IBAction func press2(_ sender: UIButton) {
        if(p==true){
                 result.text = String(sender.tag)
                 x = Double(result.text!)!
                 p = false
             }
             else{
                 result.text = result.text! + String(sender.tag)
                 x = Double(result.text!)!
                 
             }
    }
    
    
    @IBAction func press3(_ sender: UIButton) {
        if(p==true){
                 result.text = String(sender.tag)
                 x = Double(result.text!)!
                 p = false
             }
             else{
                 result.text = result.text! + String(sender.tag)
                 x = Double(result.text!)!
                 
             }
    }
    
    
    @IBAction func press4(_ sender: UIButton) {
        if(p==true){
                 result.text = String(sender.tag)
                 x = Double(result.text!)!
                 p = false
             }
             else{
                 result.text = result.text! + String(sender.tag)
                 x = Double(result.text!)!
                 
             }
    }
    
    
    @IBAction func press5(_ sender: UIButton) {
        if(p==true){
                 result.text = String(sender.tag)
                 x = Double(result.text!)!
                 p = false
             }
             else{
                 result.text = result.text! + String(sender.tag)
                 x = Double(result.text!)!
                 
             }
    }
    
    
    @IBAction func press6(_ sender: UIButton) {
        if(p==true){
                 result.text = String(sender.tag)
                 x = Double(result.text!)!
                 p = false
             }
             else{
                 result.text = result.text! + String(sender.tag)
                 x = Double(result.text!)!
                 
             }
    }
    
    @IBAction func press7(_ sender: UIButton) {
        if(p==true){
                 result.text = String(sender.tag)
                 x = Double(result.text!)!
                 p = false
             }
             else{
                 result.text = result.text! + String(sender.tag)
                 x = Double(result.text!)!
                 
             }
    }
    
    
    @IBAction func press8(_ sender: UIButton) {
        
        if(p==true){
                 result.text = String(sender.tag)
                 x = Double(result.text!)!
                 p = false
             }
             else{
                 result.text = result.text! + String(sender.tag)
                 x = Double(result.text!)!
                 
             }
    }
    
    
    @IBAction func press9(_ sender: UIButton) {
        
        if(p==true){
                 result.text = String(sender.tag)
                 x = Double(result.text!)!
                 p = false
             }
             else{
                 result.text = result.text! + String(sender.tag)
                 x = Double(result.text!)!
                 
             }
    }
    
    
    @IBAction func op6(_ sender: UIButton) {
        result.text = result.text! + "."
    }
    
    @IBAction func op5(_ sender: UIButton) {
        y = Double(result.text!)!
        result.text = ""
        s="/"
        p = true
    }
    
    
    @IBAction func op4(_ sender: UIButton) {
        y = Double(result.text!)!
               result.text = ""
               s="*"
               p = true
    }
    
    @IBAction func op3(_ sender: UIButton) {
        y = Double(result.text!)!
               result.text = ""
               s="-"
               p = true
    }
    @IBAction func op2(_ sender: UIButton) {
        y = Double(result.text!)!
               result.text = ""
               s="+"
               p = true
    }
    
    @IBAction func op1(_ sender: UIButton) {
        if (s == "+"){
                  result.text = String(x+y)
                  s=""
              }
              else if (s == "-"){
                  result.text = String(y-x)
                  s=""
              }
              else if (s == "*"){
                  result.text = String(x*y)
                  s=""
              }
              else if (s == "/"){
                  result.text = String(Double(x)/Double(y))
                  s=""
              }

    }
    @IBAction func clear(_ sender: UIButton) {
        result.text = ""
               x = 0
               y = 0
               s = ""
               p = false
    }
    
    
}
