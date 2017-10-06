//
//  UDService.swift
//  Moms Cooking App
//
//  Created by Christoffer Eenberg on 16/09/2017.
//  Copyright © 2017 Christoffer Eenberg. All rights reserved.
//

import Foundation

class UDService {
    static var albumName: String? {
        get {
            return UserDefaults.standard.string(forKey: "albumName")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "albumName")
        }
    }
}
