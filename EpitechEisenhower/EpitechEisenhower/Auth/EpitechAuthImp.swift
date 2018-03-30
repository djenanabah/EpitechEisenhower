//
//  AuthImpl.swift
//  EpitechEisenhower
//
//  Created by Djenaba Bah on 22/03/2018.
//  Copyright © 2018 Epitech. All rights reserved.
//

import Foundation
import FirebaseAuth

struct EpitechAuthImp {
    
}

extension EpitechAuthImp: EpitechAuth {
    func signInUser(email: String?,
                    password: String?,
                    completion: @escaping (ResultAuth) -> ()) {
        
        guard let email = email else {
            completion(ResultAuth.failure(ErrorAuth.emailIsNil))
            return
        }
        
        guard let password = password else {
            completion(ResultAuth.failure(ErrorAuth.passwordIsNil))
            return
        }
        
        guard email.isValidEmail else {
            completion(ResultAuth.failure(ErrorAuth.emailIsInvalid))
            return
        }
        Auth.auth().signIn(withEmail: email,
                           password: password,
                           completion: {(user, error) in
                            if let _ = user {
                                print("User : \(user)")
                                completion(ResultAuth.success(user?.email ?? "no email"))
                                
                            }else if let error = error {
                                completion(ResultAuth.failure(error))
                            }
        })
    }
	
	func signUpUser(email: String?,
                    password: String?,
                    completion: @escaping (ResultAuth) -> ()) {
        
        guard let email = email else {
            completion(ResultAuth.failure(ErrorAuth.emailIsNil))
            return
        }
        
        guard let password = password else {
            completion(ResultAuth.failure(ErrorAuth.passwordIsNil))
            return
        }
        
        guard email.isValidEmail else {
            completion(ResultAuth.failure(ErrorAuth.emailIsInvalid))
            return
        }
        Auth.auth().createUserWithEmail(email!, password: password!, completion: { (user: FIRUser?, error) in
            if error == nil {
                completion(ResultAuth.success(user?.email ?? "no email"))
            }else{
                completion(ResultAuth.failure(error))
            }
        })
    }
}
