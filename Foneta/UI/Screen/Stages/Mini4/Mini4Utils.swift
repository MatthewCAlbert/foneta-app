//
//  Mini4Utils.swift
//  Foneta
//
//  Created by Evan Susanto on 22/06/22.
//

import Foundation
import SwiftUI

func randomString(length: Int) -> String {
    let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    return String((0..<length).map { _ in letters.randomElement()! })
}

