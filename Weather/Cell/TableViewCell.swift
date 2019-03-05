//
//  TableViewCell.swift
//  TableViewPractice
//
//  Created by Serhiy Rosovskyy on 3/5/19.
//  Copyright © 2019 UCU. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var yearLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func commonInit(year: String) {
        yearLabel.text = year
    }
    
}
