//
//  UserData.swift
//  Foneta
//
//  Created by Matthew Christopher Albert on 16/06/22.
//

import Foundation

class UserData {
    let id: String // generated
    var _name: String?
    var _lastLevel: String? // level ID
    
    static let shared = UserData()
    
    private init() {
        if let id = UserDefaults.standard.string(forKey: "userId") {
            self.id = id
        } else {
            let generatedId = UUID().uuidString
            UserDefaults.standard.set(generatedId, forKey: "userId")
            self.id = generatedId
        }
        
        self._name = UserDefaults.standard.string(forKey: "name")
        self._lastLevel = UserDefaults.standard.string(forKey: "lastLevel")
    }
    
    var name: String? {
        get {
            return self._name
        }
        set(newValue) {
            self._name = newValue
            UserDefaults.standard.set(newValue, forKey: "name")
        }
    }
    
    var lastLevel: String? {
        get {
            return self._lastLevel
        }
        set(newValue) {
            self._lastLevel = newValue
            UserDefaults.standard.set(newValue, forKey: "lastLevel")
        }
    }
}
