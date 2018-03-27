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
        var arrTask: [TaskModel] = []
		var ref: DatabaseReference!
        ref = Database.database().reference()
        ref.child("self.userID").observe(.value, with: { snapshot in
			let jsonTask = snapshot.value as NSDictionary
			for item in jsonTask {
				let task = item as NSDictionary
				arrTask.append(TaskModel(titre: item["Nom"], description: item["Description"], date: item["Date"], important: true, urgent: true))
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

