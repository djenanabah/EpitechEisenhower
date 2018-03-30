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
    func userRegister(result: UserResult)
}

struct TaskPresenterImp {
    private var view: RegisterViewController?
    private var interactor: RegisterInteractor?
    private var router: RegisterRouter?
    
    mutating func setInteractor(interactor: RegisterInteractor?) {
        self.interactor = interactor
    }
    
    init(view: RegisterViewController?, router: RegisterRouter?) {
        self.view = view
        self.router = router
    }
    
    func buttonWasSelected(user: UserModel) {
       interactor?.UserModel(user: user)
    }
}

extension TaskPresenterImp: TaskPresenter {
    func userRegister(result: UserResult) {
        switch result {
		case .success(let successs):
            view?.displayError(error: success)
        case .failure(let error):
            view?.displayError(error: error.localizedDescription)
        }
    }
}
