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

class TaskViewController: UICollectionViewController{

	var presenter: TaskPresenterImp?
	
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
extension TaskViewController {
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.buttonWasSelected()
    }
}

extension TaskViewController: TaskView {
    func displayError(error: String) {
        print(error)
    }
}
