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
    return String((0..<length).map{ _ in letters.randomElement()! })
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

//enum AlphabetIndex:Int{
//    case A=0
//    case B=1
//    case C=2
//    case D=3
//    case E=4
//    case A=5
//    case A=6
//    case A=7
//    case A=8
//    case A=9
//    case A=10
//    case A=11
//    case A=12
//    case A=13
//    case A=14
//    case A=15
//    case A=16
//    case A=17
//    case A=18
//    case A=19
//    case A=20
//    case A=21
//    case A=22
//    case A=23
//    case A=24
//    case A=25
//   
//}
