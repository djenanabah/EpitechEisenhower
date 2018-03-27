//
//  HomeInteractor.swift
//  EpitechEisenhower
//
//  Created by Djenaba Bah on 22/03/2018.
//  Copyright © 2018 Epitech. All rights reserved.
//

import Foundation
import Alamofire

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
		Alamofire
            .request("https://ios-project-4d009.firebaseio.com/" + self.userID!)
            .responseJSON { (response) in
                
                print("Responce Value : \(response)")
                switch response.result {
                case .success(let _):
                    if let objJson = response.result.value as! NSArray? {
                        for element in objJson {
                            let data = element as! NSDictionary
                            arrTask.append(TaskModel(titre: data["Nom"] as! String, description: data["Description"] as! String, date: data["Date"] as! Date, important: true, urgent: true))
                        }
                    }
                    self.presenter?.dataLoaded(result: HomeResult.success(arrTask))
                    self.setResults(results: arrTask)
                    
                    /*
 if let value = value as? [String: Any], let resultsJson = value as? [String : Any] {
                        let results = resultsJson.map({ (data) -> TaskModel in
                            return TaskModel(titre: data["Nom"] as! String, description: data["Description"] as! String, date: data["Date"] as! Date, important: true, urgent: true)
                        })
                        self.presenter?.dataLoaded(result: HomeResult.success(results))
                        self.setResults(results: results)*/
                case .failure(let error):
                    self.presenter?.dataLoaded(result: HomeResult.failure(error))
                }
        }
    }
    
    func getFilteredResults(searchText: String) -> [TaskModel]? {
        return resultsManager?.resultsTask.filter { $0.titre.hasPrefix(searchText) }
    }
}
