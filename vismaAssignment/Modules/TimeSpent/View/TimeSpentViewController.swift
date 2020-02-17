//
//  TimeSpentViewController.swift
//  vismaAssignment
//
//  Created by hasti on 2/16/20.
//  Copyright © 2020 visma. All rights reserved.
//

import UIKit

class TimeSpentViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalHoursLabel: UILabel!
    
    var presenter: TimeSpentPresenter
    let timeSpentCellReuseIdentifier = "TimeSpentTableViewCell"
    
    init(presenter: TimeSpentPresenter) {
        self.presenter = presenter
        super.init(nibName: "TimeSpentViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: timeSpentCellReuseIdentifier, bundle: nil),
                           forCellReuseIdentifier: timeSpentCellReuseIdentifier)
        tableView.tableFooterView = UIView()
        title = "Time Spent"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: UIBarButtonItem.Style.done,
                                                            target: self, action: #selector(addTime))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.setupView()
    }
    
    @objc func addTime() {
        presenter.showAddTimeView()
    }
}

// MARK: - UITableViewDataSource
extension TimeSpentViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        if presenter.times.count > 0 {
            return 1
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.times.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: timeSpentCellReuseIdentifier, for: indexPath)
            as? TimeSpentTableViewCell else {
                return UITableViewCell()
        }
        let time = presenter.times[indexPath.row]
        cell.configure(date: presenter.getFormatedDate(date: time.date), hours: "\(time.hours)")
        return cell
    }
}

// MARK: - UITableViewDelegate
extension TimeSpentViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            presenter.deleteTime(indexPath: indexPath)
        }
    }
}

// MARK: - TimeSpentPresentation
extension TimeSpentViewController: TimeSpentPresentation {
    func updateTimes(totalHours: String) {
        tableView.reloadData()
        totalHoursLabel.text = totalHours
    }
}
