//
//  UserData.swift
//  Foneta
//
//  Created by Matthew Christopher Albert on 16/06/22.
//

import Foundation

class UserData {
    let id: String // generated
    private var _name: String?
    private var _lastLevel: String? // level ID
    private var _mapFound: Bool
    
    static let shared = UserData()
    
    private init() {
        if let id = UserDefaults.standard.string(forKey: "userId") {
            self.id = id
        } else {
            let generatedId = UUID().uuidString
            UserDefaults.standard.set(generatedId, forKey: "userId")
            self.id = generatedId
        }
        
        self._name = UserDefaults.standard.string(forKey: "userName")
        self._lastLevel = UserDefaults.standard.string(forKey: "lastLevel")
        self._mapFound = UserDefaults.standard.bool(forKey: "mapFound")
    }
    
    var name: String? {
        get {
            return self._name
        }
        set(newValue) {
            self._name = newValue
            UserDefaults.standard.set(newValue, forKey: "userName")
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
    
    var mapFound: Bool {
        get {
            return self._mapFound
        }
        set(newValue) {
            self._mapFound = newValue
            UserDefaults.standard.set(newValue, forKey: "mapFound")
        }
    }
}
