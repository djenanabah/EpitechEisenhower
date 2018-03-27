//
//  HomeInteractor.swift
//  EpitechEisenhower
//
//  Created by Djenaba Bah on 22/03/2018.
//  Copyright © 2018 Epitech. All rights reserved.
//

import Foundation
import Firebase

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
    private var userID: String?
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
		
		var ref = Firebase(url:"https://ios-project-4d009.firebaseio.com/" + self.userID!)
		
		ref.observeEventType(.Value, withBlock: { snapshot in
			println(snapshot.value)
			//self.presenter?.dataLoaded(result: HomeResult.success(arrTask))
            //self.setResults(results: arrTask)
		}, withCancelBlock: { error in
			self.presenter?.dataLoaded(result: HomeResult.failure(error))
		})              
        }
    }
    
func getFilteredResults(searchText: String) -> [TaskModel]? {
    return resultsManager?.resultsTask.filter { $0.titre.hasPrefix(searchText) }
}
