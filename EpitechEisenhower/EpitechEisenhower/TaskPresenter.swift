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


protocol TaskPresenter {
    func dataLoaded(result: TaskResult)
}

struct TaskPresenterImp {
    private var view: TaskViewController?
    private var interactor: TaskInteractor?
    private var router: TaskRouter?
    
    mutating func setInteractor(interactor: TaskInteractor?) {
        self.interactor = interactor
    }
    
    init(view: TaskViewController?, router: TaskRouter?) {
        self.view = view
        self.router = router
    }
    
    func buttonWasSelected(indexPath: IndexPath) {
       router?.buttonWasSelected(task: task)
    }
}

extension TaskPresenterImp: TaskPresenter {
    func dataAdded(result: TaskResult) {
        switch result {
        case .success(let results):
            return;
        case .failure(let error):
            view?.displayError(error: error.localizedDescription)
        }
    }
}
