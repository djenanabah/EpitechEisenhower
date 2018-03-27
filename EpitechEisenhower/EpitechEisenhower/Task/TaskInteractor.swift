//
//  HomeInteractor.swift
//  EpitechEisenhower
//
//  Created by Djenaba Bah on 22/03/2018.
//  Copyright © 2018 Epitech. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

enum TaskResult {
    case failure(Error)
}

protocol TaskInteractor {
    func addData(task: TaskModel)
}

struct TaskInteractorImp {
    private var presenter: TaskPresenter?
    var userID: String?

    init(presenter: TaskPresenter?, userID: String?) {
        self.presenter = presenter
        self.userID = userID
    }
}

extension TaskInteractorImp: TaskInteractor {
    
    func addData(task: TaskModel) {
		var ref: DatabaseReference!
        ref = Database.database().reference()
		let jsonString = "TATA"
        ref.child(self.userID!).setValue(jsonString)
    }
}

