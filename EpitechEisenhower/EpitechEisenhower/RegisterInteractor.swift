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

enum RegsterResult {
	case success(String)
    case failure(Error)
}

protocol RegsterInteractor {
    func userRegister(user: UserModel)
}

struct RegsterInteractorImp {
    private var presenter: RegsterPresenter?
	private var authImp : EpitechAuth?

    init(presenter: vPresenter?) {
        self.presenter = presenter
		self.authImp = EpitechAuthImp()
    }
}

extension RegsterInteractorImp: RegisterInteractor {
    
    func Regster(user: UserModel) {
		authImp?.signUpUser(email: email,
                            password: password,
                            completion: {[weak self] (result) in
                                switch result {
                                case .success :
									self.presenter?.userRegister(result: RegisterResult.success("Success"))
                                case .failure(let error):
                                    self.presenter?.userRegister(result: RegisterResult.failure(error))
                                }
        })
    }
}
