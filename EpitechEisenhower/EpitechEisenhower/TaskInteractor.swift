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
    func addData()
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
    
    func addData() {
		var ref: DatabaseReference!
        ref = Database.database().reference()
		jsonString = "TATA"
        ref.child(self.userID).setValue(jsonString)
    }
}

