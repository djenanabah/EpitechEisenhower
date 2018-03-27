//
//  HomePresenter.swift
//  EpitechEisenhower
//
//  Created by Djenaba Bah on 22/03/2018.
//  Copyright © 2018 Epitech. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa


protocol HomePresenter {
    func dataLoaded(result: HomeResult)
}

struct HomePresenterImp {
    private var view: HomeViewController?
    private var interactor: HomeInteractor?
    private var router: HomeRouter?
    
    mutating func setInteractor(interactor: HomeInteractor?) {
        self.interactor = interactor
    }
    
    init(view: HomeViewController?, router: HomeRouter?) {
        self.view = view
        self.router = router
    }
    
    func loadData() {
        interactor?.loadData()
    }
    
    func cellWasSelected(indexPath: IndexPath) {
        if let task = interactor?.getTaskAtIndexPath(indexPath: indexPath) {
            router?.cellWasSelected(task: task)
        }
    }
}

extension HomePresenterImp: HomePresenter {
    func dataLoaded(result: HomeResult) {
        switch result {
        case .success(let results):
            view?.receiveData(results: results)
        case .failure(let error):
            view?.displayError(error: error.localizedDescription)
        }
    }
}
