//
//  ResultsManager.swift
//  EpitechEisenhower
//
//  Created by Djenaba Bah on 22/03/2018.
//  Copyright © 2018 Epitech. All rights reserved.
//

import Foundation

protocol ResultsManager: class {
    var results: [UserModel] {get set}
}

class ResultsManagerImp: ResultsManager {
    var results = [UserModel]()
    static let sharedInstance = ResultsManagerImp()
    private init() {}
}
