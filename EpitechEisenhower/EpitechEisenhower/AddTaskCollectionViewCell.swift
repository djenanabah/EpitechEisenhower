//
//  AddTaskCollectionViewCell.swift
//  EpitechEisenhower
//
//  Created by Djenaba Bah on 27/03/2018.
//  Copyright © 2018 Epitech. All rights reserved.
//

import UIKit

class AddTaskCollectionViewCell: UICollectionViewCell {
    
    var presenter : HomePresenterImp?
    
    
    @IBAction func onAddTaskTapped(_ sender: Any) {
        print("Add Task Tapped")
        presenter?.cellAddTaskSelected()
    }
    
    func setPresenter(presenter: HomePresenterImp) {
        self.presenter = presenter
    }
}
