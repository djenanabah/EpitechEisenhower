//
//  Auth.swift
//  EpitechEisenhower
//
//  Created by Djenaba Bah on 22/03/2018.
//  Copyright © 2018 Epitech. All rights reserved.
//

import Foundation

enum ErrorAuth: Error {
    case emailIsNil
    case passwordIsNil
    case emailIsInvalid
}

enum ResultAuth {
    case success(String)
    case failure(Error)
}

protocol EpitechAuth {
    func signInUser(email:String?, password: String?, completion: @escaping (ResultAuth) -> ())
}

