//
//  AddTimeViewController.swift
//  vismaAssignment
//
//  Created by hasti on 2/16/20.
//  Copyright © 2020 visma. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class AddTimeViewController: UIViewController {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var hoursTextField: UITextField!
    @IBOutlet weak var minutesTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var hoursLabel: UILabel!
    
    var presenter: AddTimePresenter
    let disposeBag = DisposeBag()
    
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
        
        datePicker.rx.date
            .distinctUntilChanged()
            .subscribe(onNext: { [weak self] date in
                guard let self = self else { return }
                self.dateLabel.text = self.presenter.getFormatedDate(date: self.datePicker.date)
            }).disposed(by: disposeBag)
        
        datePicker.datePickerMode = .date
        datePicker.date = Date()
        
        hoursTextField.rx.text
            .orEmpty
            .distinctUntilChanged()
            .debounce(.milliseconds(500), scheduler: MainScheduler.instance)
            .subscribe(onNext: { [weak self] hours in
                self?.presenter.updateHourValue(hour: hours)
            }).disposed(by: disposeBag)
        
        minutesTextField.rx.text
            .orEmpty
            .distinctUntilChanged()
            .debounce(.milliseconds(500), scheduler: MainScheduler.instance)
            .subscribe(onNext: { [weak self] min in
                self?.presenter.updateMinuteValue(min: min)
            }).disposed(by: disposeBag)
    }
    
    @objc func saveTime() {
        presenter.saveTime(date: datePicker.date, hours: hoursLabel.text)
    }
}

// MARK: - AddTimePresentation
extension AddTimeViewController: AddTimePresentation {
    func showHoursError() {
        hoursTextField.shake()
    }
    
    func updateHours(hour: String) {
        hoursLabel.text = hour
    }
}
