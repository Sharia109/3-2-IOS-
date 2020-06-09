//
//  TodoCell.swift
//  Business
//
//  Created by kuetcse on 4/12/19.
//  Copyright © 2019 kuetcse. All rights reserved.
//

import UIKit

class TodoCell: UITableViewCell {

    
    @IBOutlet weak var todoLabel: UILabel!
    
    @IBOutlet weak var checkmarkImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
