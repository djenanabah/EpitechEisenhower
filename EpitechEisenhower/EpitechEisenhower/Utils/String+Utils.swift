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
		let formatter = DateFormatter()
		formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

		let myString = formatter.string(from: date)
		let yourDate = formatter.date(from: myString)
		formatter.dateFormat = "dd-MMM-yyyy"
		formatter.locale = NSLocale(localeIdentifier: "fr_FR_POSIX") as Locale!
		let myStringafd = formatter.string(from: yourDate!)

        return myStringafd
    }
    
    func StringAsBool(value:String) -> Bool {
        if (value == "true"){
            return true
        }
        return false
    }
}
