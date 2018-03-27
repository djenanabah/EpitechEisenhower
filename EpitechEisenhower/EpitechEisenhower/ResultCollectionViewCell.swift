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
    @IBOutlet weak var dateLabel: UILabel!
    
    func setModel(model: TaskModel) {
        myTitle.text = model.titre
        let formatter = DateFormatter()
        //then again set the date format whhich type of output you need
        formatter.dateFormat = "dd-MMM-yyyy"
        // again convert your date to string
        dateLabel.text = formatter.string(from: model.date)
    }
}
