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

enum HomeResult {
    case success([TaskModel])
    case failure(Error)
}

protocol HomeInteractor {
    func loadData()
    func getTaskAtIndexPath(indexPath: IndexPath) -> TaskModel?
    func getFilteredResults(searchText: String) -> [TaskModel]?
}

struct HomeInteractorImp {
    private var presenter: HomePresenter?
    private var resultsManager: ResultsManager?
    var userID: String?

    init(presenter: HomePresenter?, resultsManager: ResultsManager?, userID: String?) {
        self.presenter = presenter
        self.resultsManager = resultsManager
        self.userID = userID
    }
}

extension HomeInteractorImp: HomeInteractor {
    
    func getTaskAtIndexPath(indexPath: IndexPath) -> TaskModel? {
        guard indexPath.row < resultsManager?.resultsTask.count ?? 0 else {
            return nil
        }
        return resultsManager?.resultsTask[indexPath.row]
    }
    
    func setResults(results: [TaskModel]) {
        resultsManager?.resultsTask = results
    }
    
    func loadData() {
        print("LoadData")
        var arrTask: [TaskModel] = []
        arrTask.append(TaskModel(titre: "", description: "", date: Date(), important: true, urgent: true))
		var ref: DatabaseReference!
        ref = Database.database().reference()
        ref.child(self.userID!).observe(.value, with: { snapshot in
            let value = snapshot.value as? NSDictionary
            if (value != nil) {
                for item in value! {
                    let task = item.value as! NSDictionary
                    print("item : \(String(describing: task["date"]))")
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "dd-MM-yyyy"
                    dateFormatter.locale = NSLocale(localeIdentifier: "fr_FR_POSIX") as Locale!
                    let date = dateFormatter.date(from: task["date"] as! String)!
                    let utils = Utils()
                    let important = utils.StringAsBool(value: task["important"] as! String)
                    let urgent = utils.StringAsBool(value: task["urgent"] as! String)
                    arrTask.append(TaskModel(titre: task["nom"] as! String, description: task["description"] as! String, date: date, important: important, urgent: urgent))
                }
            }
            print(arrTask)
            self.presenter?.dataLoaded(result: HomeResult.success(arrTask))
            self.setResults(results: arrTask)
        }, withCancel: { error in
            self.presenter?.dataLoaded(result: HomeResult.failure(error))
        })
    }

    func getFilteredResults(searchText: String) -> [TaskModel]? {
        return resultsManager?.resultsTask.filter { $0.titre.hasPrefix(searchText) }
    }
}

