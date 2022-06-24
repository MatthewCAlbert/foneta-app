//
//  ControllerMini4.swift
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

enum PaddingType {
    case leading
    case trailing
    case top
    case bottom
}

func enumParserPaddingType(paddingTypes:[PaddingType]) -> Edge.Set {
    for paddingType in paddingTypes {
        switch paddingType {
        case .leading:
            return .leading
        case .trailing:
            return .trailing
        case .top:
            return .top
        case .bottom:
            return .bottom

        }
    }
    return .leading
}
