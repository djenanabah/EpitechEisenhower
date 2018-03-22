//
//  TaskModel.swift
//  EpitechEisenhower
//
//  Created by fauquette fred on 6/12/17.
//  Copyright © 2017 Epitech. All rights reserved.
//

import Foundation

struct TaskModel {
    private(set) var titre: String
    
    mutating func newTitle(title:String) {
        self.titre = title
    }
}
