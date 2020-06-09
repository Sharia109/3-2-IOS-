//
//  TableViewCell.swift
//  Business
//
//  Created by kuetcse on 4/12/19.
//  Copyright © 2019 kuetcse. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    

    
    @IBOutlet weak var lbl_organization_name: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
