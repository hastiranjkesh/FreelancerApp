//
//  AddProjectViewController.swift
//  vismaAssignment
//
//  Created by hasti on 2/16/20.
//  Copyright © 2020 visma. All rights reserved.
//

import UIKit

class AddProjectViewController: UIViewController {
    
    var presenter: AddProjectPresenter
    
    @IBOutlet weak var projectNameTextField: UITextField!
    
    init(presenter: AddProjectPresenter) {
        self.presenter = presenter
        super.init(nibName: "AddProjectViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "New Project"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "close", style: UIBarButtonItem.Style.done,
                                                           target: self, action: #selector(closeView))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: UIBarButtonItem.Style.done,
                                                            target: self, action: #selector(saveProject))
    }
    
    @objc func saveProject() {
        presenter.saveNewProject(name: projectNameTextField.text)
    }
    
    @objc func closeView() {
        presenter.closeNewProjectView()
    }
}

// MARK: - AddProjectPresentation
extension AddProjectViewController: AddProjectPresentation {
    func showProjectNameError() {
        projectNameTextField.shake()
    }
}
