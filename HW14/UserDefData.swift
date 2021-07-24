//
//  UserDefData.swift
//  HW14
//
//  Created by Олег Малышев on 11.07.2021.
//

import Foundation


class UserDefData {
    
    static let shared = UserDefData()
    
    private let kFirstNameKey = "UserDefData.kFirstNameKey"
    private let kSecondName = "UserDefData.kSecondName"
    
    var firstName: String? {
        set{UserDefaults.standard.setValue(newValue, forKey: kFirstNameKey)}
        get{return UserDefaults.standard.string(forKey: kFirstNameKey)}
    }
    
    var secondName: String? {
        set{UserDefaults.standard.setValue(newValue, forKey: kSecondName)}
        get{return UserDefaults.standard.string(forKey: kSecondName)}
    }
    
    
    
}
