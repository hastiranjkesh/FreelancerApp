//
//  AddTimeViewController.swift
//  vismaAssignment
//
//  Created by hasti on 2/16/20.
//  Copyright © 2020 visma. All rights reserved.
//

import UIKit

class AddTimeViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var hoursTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    var presenter: AddTimePresenter
    
    init(presenter: AddTimePresenter) {
        self.presenter = presenter
        super.init(nibName: "AddTimeViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add Time"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: UIBarButtonItem.Style.done,
        target: self, action: #selector(saveTime))
        datePicker.datePickerMode = .date
        dateLabel.text = presenter.getFormatedDate(date: Date())
        datePicker.date = Date()
    }
    
    @IBAction func datePickerValueChanged(_ sender: Any) {
        let selectedDate = presenter.getFormatedDate(date: datePicker.date)
        dateLabel.text = selectedDate
    }
    
    @objc func saveTime() {
        presenter.saveTime(date: datePicker.date, hours: hoursTextField.text)
    }
}

// MARK: - AddTimePresentation
extension AddTimeViewController: AddTimePresentation {
    func showHoursError() {
        hoursTextField.shake()
    }
}
