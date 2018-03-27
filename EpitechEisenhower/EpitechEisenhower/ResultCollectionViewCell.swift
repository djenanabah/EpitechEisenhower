//
//  CustomCell.swift
//  EpitechEisenhower
//
//  Created by fauquette fred on 6/12/17.
//  Copyright © 2017 Epitech. All rights reserved.
//

import UIKit
class ResultCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var myTitle: UILabel!
    
    func setModel(model: TaskModel) {
        myTitle.text = model.titre
    }
}
