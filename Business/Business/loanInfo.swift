//
//  loanInfo.swift
//  Business
//
//  Created by kuetcse on 4/12/19.
//  Copyright © 2019 kuetcse. All rights reserved.
//

import UIKit
struct jsonstruct:Decodable {
   let organization_name:String
   let organization_description:String
   let Minimum_FICO_score:String
   let Maximum_debt_to_income_ratio:String
   let Co_signer_option:String
   let Preapproval_or_rate_quotes_available:String
   let Loan_amounts:String
   let Loan_terms:String
   let Loan_use_restrictions:String
   let Discounts:String
   let Origination_fee:String
}
class loanInfo: UIViewController,UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet var tableview: UITableView!
    var arrdata = [jsonstruct]()
    override func viewDidLoad() {
        super.viewDidLoad()
        getdata()
        // Do any additional setup after loading the view.
    }
    
    func getdata(){
        let url = URL(string: "https://api.myjson.com/bins/wom4w")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            do{if error == nil{
                self.arrdata = try JSONDecoder().decode([jsonstruct].self, from: data!)
                
                for _ in self.arrdata{
                    DispatchQueue.main.async {
                         self.tableview.reloadData()
                    }
                   
                }
                }
            
            }catch{
                print("Error in get json data")
            }
            
        }.resume()
    }    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrdata.count
    }
    
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell:TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
       cell.lbl_organization_name.text = "Organization Name : \(arrdata[indexPath.row].organization_name)"

       return cell
   }

   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let detail:DetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "detail") as! DetailViewController
      
       detail.strMinimum_FICO_score = "Minimum FICO score :\(arrdata[indexPath.row].Minimum_FICO_score)"
        detail.strMaximum_debt_to_income_ratio = "Maximum debt_to_income ratio :\(arrdata[indexPath.row].Maximum_debt_to_income_ratio)"
        detail.strCo_signer_option = "Co signer option :\(arrdata[indexPath.row].Co_signer_option)"
        detail.strLoan_amounts = "Loan amounts:\(arrdata[indexPath.row].Loan_amounts)"
        detail.strLoan_terms = "Loan terms :\(arrdata[indexPath.row].Loan_terms)"
       
         detail.strDiscounts = "Discounts:\(arrdata[indexPath.row].Discounts)"
           detail.strOrigination_fee = "Origination fee:\(arrdata[indexPath.row].Origination_fee)"
       self.navigationController?.pushViewController(detail, animated: true)


   }
}
