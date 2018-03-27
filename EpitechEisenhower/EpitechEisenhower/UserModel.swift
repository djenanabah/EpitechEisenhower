//
//  UserModel.swift
//  EpitechEisenhower
//
//  Created by Djenaba Bah on 27/03/2018.
//  Copyright © 2018 Epitech. All rights reserved.
//

import Foundation

struct UserModel {
    private(set) var firstName: String
    private(set) var lastName: String
    private(set) var email: String
    private(set) var description: String
    
    init(firstName: String, lastName: String, email: String, description: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.description = description
    }
    
    mutating func setName(firstName: String, lastName:String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    mutating func setEmail(email: String){
        self.email = email
    }
    
    mutating func setDescription(description: String){
        self.description = description
    }
    
}
