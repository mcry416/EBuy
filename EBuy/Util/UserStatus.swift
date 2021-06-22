//
//  UserStatus.swift
//  EBuy
//
//  Created by Eldest's MacBook on 2021/6/19.
//

import Foundation
import UIKit

class UserStatus{
    
    public static func isUserExist() -> Bool {
        let userDefaults = UserDefaults.standard
        if (userDefaults.string(forKey: "user_id")!.count > 0) {
            return true
        } else {
            return false
        }
    }
    
    public static func getUserId() -> String {
        let userDefaults = UserDefaults.standard
        return userDefaults.string(forKey: "user_id")!
    }
    
    public static func getUserPassword() -> String {
        let userDefaults = UserDefaults.standard
        return userDefaults.string(forKey: "user_password")!
    }
}
