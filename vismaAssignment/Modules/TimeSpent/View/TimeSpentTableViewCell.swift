//
//  TimeSpentTableViewCell.swift
//  vismaAssignment
//
//  Created by hasti on 2/16/20.
//  Copyright © 2020 visma. All rights reserved.
//

import UIKit

class TimeSpentTableViewCell: UITableViewCell {

    @IBOutlet weak var hoursLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    func configure(date: String, hours: String) {
        dateLabel.text = date
        hoursLabel.text = hours
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
