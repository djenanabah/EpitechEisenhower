//
//  HomeViewController.swift
//  EpitechEisenhower
//
//  Created by fauquette fred on 29/11/17.
//  Copyright © 2017 Epitech. All rights reserved.
//

import UIKit
import Alamofire

protocol TaskView: class {
    func displayError(error: String)
}

class TaskViewController: UIViewController{

	var presenter: TaskPresenterImp?
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onSaveButtonTapped(_ sender: Any) {
        presenter?.buttonWasSelected(task: TaskModel(titre: titleTextField.text!, description: descriptionTextField.text!, date: Date(), important: true, urgent: true))
    }
}

extension TaskViewController: TaskView {
    func displayError(error: String) {
        print(error)
    }
}
