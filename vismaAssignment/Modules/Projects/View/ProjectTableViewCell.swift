//
//  ProjectTableViewCell.swift
//  vismaAssignment
//
//  Created by hasti on 2/16/20.
//  Copyright © 2020 visma. All rights reserved.
//

import UIKit

final class ProjectTableViewCell: UITableViewCell {

    @IBOutlet weak var projectNameLabel: UILabel!
    @IBOutlet weak var totalHoursLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(name: String, hours: String) {
        projectNameLabel.text = name
        totalHoursLabel.text = hours
    }
}
