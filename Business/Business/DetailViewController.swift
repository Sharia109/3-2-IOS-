//
//  DetailViewController.swift
//  Business
//
//  Created by kuetcse on 4/12/19.
//  Copyright © 2019 kuetcse. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
   
     
    @IBOutlet weak var lbl_organization_description: UILabel!
    @IBOutlet weak var lbl_Minimum_FICO_score: UILabel!
    
    
    @IBOutlet weak var lbl_Maximum_debt_to_income_ratio: UILabel!
    
    @IBOutlet weak var lbl_Co_signer_option: UILabel!
    
    @IBOutlet weak var lbl_Preapproval_or_rate_quotes_available: UILabel!
    
    @IBOutlet weak var lbl_Loan_amounts: UILabel!
    
    
    @IBOutlet weak var lbl_Loan_terms: UILabel!
    
   
    
    @IBOutlet weak var lbl_Discounts: UILabel!
   

    @IBOutlet weak var lbl_Origination_fee: UILabel!
    



   
     var strMinimum_FICO_score = ""
     var strMaximum_debt_to_income_ratio = ""
     var strCo_signer_option = ""
     var strPreapproval_or_rate_quotes_available = ""
     var strLoan_amounts = ""
     var strLoan_terms = ""
   
     var strDiscounts = ""
     var strOrigination_fee = ""


     override func viewDidLoad() {
         super.viewDidLoad()
        
         lbl_Minimum_FICO_score.text = strMinimum_FICO_score
       lbl_Maximum_debt_to_income_ratio.text = strMaximum_debt_to_income_ratio
       lbl_Co_signer_option.text = strCo_signer_option
       lbl_Preapproval_or_rate_quotes_available.text = strPreapproval_or_rate_quotes_available
       lbl_Loan_amounts.text = strLoan_amounts
     lbl_Loan_terms.text = strLoan_terms
    
     lbl_Discounts.text = strDiscounts
     lbl_Origination_fee.text = strOrigination_fee


     }

    override func didReceiveMemoryWarning() {
          super.didReceiveMemoryWarning()
          // Dispose of any resources that can be recreated.
      }    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
