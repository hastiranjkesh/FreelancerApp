//
//  ProjectsViewController.swift
//  vismaAssignment
//
//  Created by hasti on 2/16/20.
//  Copyright © 2020 visma. All rights reserved.
//

import UIKit

final class ProjectsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var presenter: ProjectsPresenter
    let projectCellReuseIdentifier = "ProjectTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: projectCellReuseIdentifier, bundle: nil),
                           forCellReuseIdentifier: projectCellReuseIdentifier)
        tableView.tableFooterView = UIView()
        tableView.allowsSelectionDuringEditing = false
        title = "Projects"
    }
    
    init(presenter: ProjectsPresenter) {
        self.presenter = presenter
        super.init(nibName: "ProjectsViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.setupView()
    }
    
    @IBAction func addProjectButtonTapped(_ sender: Any) {
        presenter.showAddProjectView()
    }
}

// MARK: - UITableViewDelegate
extension ProjectsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.projectDidSelect(indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            presenter.deleteProject(indexPath: indexPath)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

// MARK: - UITableViewDataSource
extension ProjectsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        if presenter.projects.count > 0 {
            return 1
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.projects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: projectCellReuseIdentifier, for: indexPath)
            as? ProjectTableViewCell else { return UITableViewCell() }
        let project = presenter.projects[indexPath.row]
        let hours = "\(project.hours) Hours"
        cell.configure(name: project.name, hours: hours)
        return cell
    }
}

// MARK: - ProjectsPresentation
extension ProjectsViewController: ProjectsPresentation {
    func updateProjects() {
        tableView.reloadData()
    }
}
