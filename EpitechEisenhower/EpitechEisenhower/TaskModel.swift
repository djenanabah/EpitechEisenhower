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
	private(set) var description: String
	private(set) var date: Date
    private(set) var important: Bool
    private(set) var urgent: Bool
    
    mutating func newTitle(title:String) {
        self.titre = title
    }
}
