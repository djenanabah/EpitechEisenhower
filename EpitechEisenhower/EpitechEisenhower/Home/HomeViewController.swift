//
//  HomeViewController.swift
//  EpitechEisenhower
//
//  Created by fauquette fred on 29/11/17.
//  Copyright © 2017 Epitech. All rights reserved.
//

import UIKit
import Alamofire


class HomeViewController: UICollectionViewController {

	var presenter: HomePresenterImp?
	private var displayResults = [TaskModel]()
	
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.loadData()
    }
    
    extension HomeViewController: UICollectionViewDataSource {
		func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
			return displayResults.count
		}
		
		func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell",
														  for: indexPath)
			if let cell = cell as? ResultCollectionViewCell {
				cell.setModel(model: displayResults[indexPath.row])
			}
			return cell
		}
	}

	extension HomeViewController: UICollectionViewDelegate {
		func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
			presenter?.cellWasSelected(indexPath: indexPath)
		}
	}

	extension HomeViewController: HomeView {
		func receiveData(results: [TaskModel]) {
			displayResults = results
			collectionView.reloadData()
		}
		func displayError(error: String) {
			print(error)
		}
	}
}
