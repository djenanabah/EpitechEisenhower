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
    init(presenter: HomePresenter?, resultsManager: ResultsManager?) {
        self.presenter = presenter
        self.resultsManager = resultsManager
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
		Alamofire
            .request("https://ios-project-4d009.firebaseio.com/" + userId)
            .responseJSON { (response) in
                switch response.result {
                case .success(let value):
                    if let value = value as? [String: Any], let resultsJson = value as? [Any] {
                        self.content = resultsJson.map({ (data) -> TaskModel in
                            return TaskModel(titre: data["Nom"] as! String, description: data["Description"] as! String, date: data["Date"] as! Date)
                        })
                       self.collectionView.reloadData()
                    }
                case .failure(let error):
                    print("erreur \(error)")
                }
        }
    }
    
    func getFilteredResults(searchText: String) -> [TaskModel]? {
        return resultsManager?.resultsTask.filter { $0.name.hasPrefix(searchText) }
    }
}
