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
        let utils = Utils()
        let date : String? = utils.DateAsString(task.date) as String
        let important : String? = utils.BoolAsString(task.important) as String
        let urgent : String? = utils.BoolAsString(task.urgent) as String
        ref = Database.database().reference()
        ref.child(self.userID!).childByAutoId().setValue(["nom": task.titre as NSString, "description": task.description as NSString, "date": date! as NSString, "important": important! as NSString, "urgent":urgent! as NSString])
    }
}

//, "date": (DateAsString(task.date) as NSString), "important":BoolAsString(task.important) as NSString, "urgent":BoolAsString(task.urgent) as NSString
