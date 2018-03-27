//
//  HomeViewController.swift
//  EpitechEisenhower
//
//  Created by fauquette fred on 29/11/17.
//  Copyright © 2017 Epitech. All rights reserved.
//

import UIKit
import Alamofire

protocol HomeView: class {
    func receiveData(results: [TaskModel])
    func displayError(error: String)
    var searchTextField: UITextField?{get}
}

class HomeViewController: UICollectionViewController{

	var presenter: HomePresenterImp?
    @IBOutlet weak var searchTextField: UITextField?

	private var displayResults = [TaskModel]()
	
    @IBOutlet private weak var collectView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.loadData()
    }
}

extension HomeViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return displayResults.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectView.dequeueReusableCell(withReuseIdentifier: "cell",
                                                      for: indexPath)
        if let cell = cell as? ResultCollectionViewCell {
            cell.setModel(model: displayResults[indexPath.row])
        }
        return cell
    }
}

extension HomeViewController {
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.cellWasSelected(indexPath: indexPath)
    }
}

extension HomeViewController: HomeView {
    func receiveData(results: [TaskModel]) {
        displayResults = results
       // collectView.reloadData()
    }
    func displayError(error: String) {
        print(error)
    }
}
