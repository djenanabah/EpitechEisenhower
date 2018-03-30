//
//  String+Utils.swift
//  EpitechEisenhower
//
//  Created by Djenaba Bah on 22/03/2018.
//  Copyright © 2018 Epitech. All rights reserved.
//

import Foundation

extension String {
    var isValidEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
}

class Utils{
    func BoolAsString(_ attribut: Bool) -> NSString {
        if (attribut == true) {
            return "true"
        }
        return "false"
    }

    func DateAsString(_ date: Date) -> NSString {
        return "06-06-2018"
    }
    
    func StringAsBool(value:String) -> Bool {
        if (value == "true"){
            return true
        }
        return false
    }
}
